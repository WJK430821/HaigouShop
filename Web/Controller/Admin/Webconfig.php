<?php
//站点设置
class Webconfig extends Controller
{
	public function show()
	{
		$mod = new Model("webconfig");
		$this->list=$mod->select();
		$this->display("show");
	}

	public function add()
	{
		$this->display("add");
	}
	public function insert()
	{
		$_POST['addtime']=time();
		$mod = new Model("webconfig");
		$m = $mod->insert();
		$m>0?header("Location:".URL."/webconfig/show"):"添加失败！";
	}

	//编辑站点设置
	public function edit()
	{
		$mod = new Model("webconfig");
		$this->stmt=$mod->find($_GET['id']);
		$this->display("edit");
	}
	public function update()
	{
		$mod = new Model("webconfig");
		$m=$mod->update();
		$m>0?header("Location:".URL."/webconfig/show"):"修改失败！";
	}
}