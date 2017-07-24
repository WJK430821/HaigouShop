<?php
//商品类型
class Type extends Controller
{
	//浏览商品类型
	public function show()
	{
		$mod=new Model("type");
		//执行查询并将结果放置到对象中
		$sql="select * from type order by concat(path,id)";
		$this->list=$mod->query($sql);
		$this->display("show");
	}

	//商品类型添加
	public function add()
	{
		//获取父类别信息
		$type=['id'=>0,'name'=>'根类别','pid'=>0,'path'=>''];//默认根类别信息
		if(!empty($_GET['id'])){
			$mod = new Model("type");
			$type = $mod->find($_GET['id']);
		}
		//将当前获取的类别信息放置到对象中作为vo属性的值
		$this->vo=$type;
		$this->display("add");
	}
	public function insert()
	{
		$mod=new Model("type");
		$m=$mod->insert();
		if($m>0){
			header("Location:".URL."/type/show");
		}else{
			echo "添加失败！";
		}
	}

	//商品分类编辑
	public function edit()
	{
		$mod=new Model("type");
		$this->stmt=$mod->find($_GET['id']);
		$this->display("edit");
	}
	public function update()
	{
		$mod=new Model("type");
		$m=$mod->update();
		if($m>0){
			header("Location:".URL."/type/show");
		}else{
			echo "修改失败";
		}
	}
	//删除
	public function del()
	{
		$mod=new Model("type");
		//判断当前类别下是否有子类，若有则不允许删除
		$sql = "select * from type where pid={$_GET['id']}";
		if(count($mod->query($sql))>0){
			die("删除失败！禁止删除含有子分类的类别！");
		}
		$mod->del($_GET['id']);
		header("Location:".URL."/type/show");
	}
}