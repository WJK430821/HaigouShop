<?php
//友情链接
class Links extends Controller
{
	public function show()
	{	
		$mod=new Model("links");
		$this->list=$mod->select();
		$this->display("show");
	}

	//添加链接
	public function add()
	{
		$this->display("add");
	}
	public function insert()
	{
		$mod=new Model("links");
		$_POST['addtime']=time();
		$m=$mod->insert();
		$m>0?header("Location:".URL."/links/show"):"添加失败！";
	}

	//编辑链接
	public function edit()
	{
		$mod = new Model("links");
		$this->stmt=$mod->find($_GET['id']);
		$this->display("edit");
	}

	public function update()
	{
		$mod = new Model("links");
		$m = $mod->update();
		$m>0?header("Location:".URL."/links/show"):"修改失败！";
	}
	//删除
	public function del()
	{
		$mod = new Model("links");
		$m = $mod->del($_GET['id']);
		$m>0?header("Location:".URL."/links/show"):"删除失败！";
	}
}
