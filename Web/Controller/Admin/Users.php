<?php
//自定义users信息控制类
class Users extends Controller
{
	public function indexs()
	{
		//实例化Model类
		$mod=new Model("users");
		//判断要查询的信息
		if(!empty($_GET['username'])){
			$mod->where("username like '%{$_GET['username']}%'");
		}
		if(!empty($_GET['name'])){
			$mod->where("name like '%{$_GET['name']}%'");
		}
		if(!empty($_GET['phone'])){
			$mod->where("phone like '%{$_GET['phone']}%'");
		}
		if(!empty($_GET['email'])){
			$mod->where("email like '%{$_GET['email']}%'");
		}
		//实例化分页对象
        $page = new Page($mod->count(),7);
        //执行搜索查询
        $this->list = $mod->limit($page->limit())->select();
        
        $this->page = $page->show();
		//加载模版
		$this->display("indexs");
	}

	// public function fenye()
	// {
	// 	$mod=new Model("users");
	// 	if(!empty($_GET['username'])){
 //            $mod->where("username like '%{$_GET['username']}%'");
 //        }
 //        if(!empty($_GET['name'])){
 //            $mod->where("name like '%{$_GET['name']}%'");
 //        }

	// 	$page = new Page($mod->count(),8);
	// 	//执行搜索查询
 //        $list = $mod->limit($page->limit())->select();
 //        $this->display("indexs");
	// }
	public function add()
	{

		$this->display("add");
	}

	public function insert()
	{
		//实例化Model类
		$mod=new Model("users");
		$_POST['pass']=md5($_POST['pass']);
		$_POST['addtime']=time();
		//执行添加
		$m=$mod->insert();

		if($m>0){
			echo "添加成功！";
			header("Location:".URL."/users/indexs");
		}else{
			echo "添加失败！";
		}
	}
	//编辑会员信息
	public function edit()
	{
		$mod=new Model("users");
		$this->list=$mod->find($_GET['id']);
		$this->display("edit");
	}
	public function update()
	{
		$mod=new Model("users");
		$m=$mod->update();
		if($m>0){
			header("Location:".URL."/users/indexs");
		}else{
			echo "修改失败！";
		}
	}
	//删除会员信息
	public function del()
	{
		$mod=new Model("users");
		$m=$mod->del($_GET['id']);
		header("Location:".URL."/users/indexs");
	}
}