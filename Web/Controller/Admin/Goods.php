<?php
//商品信息

class Goods extends Controller
{
	private $path = "./Public/uploads/";
    private $types = array("image/jpeg","image/png","image/gif");

	public function show()
	{
		$mod=new Model("goods");
		if(!empty($_GET['goods'])){
			$mod->where("goods like '%{$_GET['goods']}%'");
		}
		if(!empty($_GET['company'])){
			$mod->where("company like '%{$_GET['company']}%'");
		}
		$page = new Page($mod->count(),10);
        //执行搜索查询
        $this->list = $mod->limit($page->limit())->select();
        $tmod=new Model("type");
        foreach($this->list as &$vo){
        	$t=$tmod->find($vo['typeid']);
        	$vo['typename']=$t['name'];
        }
        $this->page = $page->show();
		$this->display("show");
	}

	public function add()
	{

		//获取类别信息
        $mod = new Model("type");
        $sql = "select * from type order by concat(path,id)";
        $this->typeList = $mod->query($sql);
		$this->display("add");
	}
	public function insert()
	{
		//执行图片上传
        $upload = new FileUpload($_FILES['picname']);
        $upload->path = $this->path; //上传文件存储目录
        $upload->typeList = $this->types; //允许上传文件类型
        if(!$upload->upload()){
            die("图片上传失败！原因：".$upload->errinfo);
        }
         //执行缩放
	    imageResize($upload->fileName,$this->path,155,158,"s_");
	    imageResize($upload->fileName,$this->path,262,262,"m_");
	    imageResize($upload->fileName,$this->path,400,400,"");
	    //获取要添加的其它字段信息
	    $_POST['picname']=$upload->fileName;
		$_POST['addtime']=time();
		$_POST['state']=1;
        $_POST['num']=0;
        $_POST['clicknum']=0;
        $mod=new Model("goods");
		$m=$mod->insert();
		if($m>0){
			header("Location:".URL."/goods/show");
		}else{
			echo "添加失败！";
			@unlink($this->path."s_".$upload->fileName);
            @unlink($this->path."m_".$upload->fileName);
            @unlink($this->path.$upload->fileName);
		}
	}
	//编辑
	public function edit()
	{
        $mod=new Model("goods");
		$this->goods=$mod->find($_GET['id']);
		//获取类别
        $sql = "select * from type order by concat(path,id)";
        $this->typeList = $mod->query($sql);
		$this->display("edit");
	}
	public function update()
	{
		if($_FILES['pic']['error']!=4){
	        $upload = new FileUpload($_FILES['pic']);
	        $upload->path = $this->path; //上传文件存储目录
        	$upload->typeList = $this->types; //允许上传文件类型
	        if(!$upload->upload()){
	            die("图片上传失败！原因：".$upload->errinfo);
	        }
		    imageResize($upload->fileName,$this->path,155,158,"s_");
		    imageResize($upload->fileName,$this->path,262,262,"m_");
		    imageResize($upload->fileName,$this->path,400,400,"");
		    $_POST['picname'] = $upload->fileName; //封装新图片信息
		}	

		$mod=new Model("goods");
		$m=$mod->update();
		//判断是否修改成功！
        if($m>0){
            //判断有新图上传
            if($_FILES['pic']['error']!=4){
                //删除原图片
                @unlink($this->path."s_".$_POST['oldpic']);
                @unlink($this->path."m_".$_POST['oldpic']);
                @unlink($this->path.$_POST['oldpic']);
            }
            header("Location:".URL."/goods/show");
        }else{
            //判断有新图上传
            if($_FILES['pic']['error']!=4){
                //删除新图片
                @unlink($this->path."s_".$upload->fileName);
                @unlink($this->path."m_".$upload->fileName);
                @unlink($this->path.$upload->fileName);
            }
            echo "修改失败！";
        }
	}
	//删除
	public function del()
	{
		$mod=new Model("goods");
		$this->m=$mod->find($_GET['id']);
		$m=$mod->del($_GET['id']);
		if($m>0){
			@unlink("./Public/uploads/s_".$this->m['picname']);
            @unlink("./Public/uploads/m_".$this->m['picname']);
            @unlink("./Public/uploads/".$this->m['picname']);
		}
		header("Location:".URL."/goods/show");
	}

}
