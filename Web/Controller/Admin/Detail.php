<?php
//订单
class Detail extends Controller
{
	public function show()
	{
		$mod=new Model("detail");
		$this->list=$mod->select();
		$this->display("show");
	}
	public function add()
	{
		$this->display("add");
	}
	public function insert()
	{
		$mod=new Model("detail");
		$m=$mod->insert();
		$m>0?header("Location:".URL."/detail/show"):"添加失败";
	}

	public function del()
	{
		$mod=new Model("detail");
		$m=$mod->del($_GET['id']);
		$m>0?header("Location:".URL."/detail/show"):"删除失败！";
	}

	//编辑
	public function edit()
	{
		$mod=new Model("detail");
		$this->m=$mod->find($_GET['id']);
		$this->display("edit");
	}

	public function update()
	{
		$mod=new Model("detail");
		$_POST['addtime']=time();
		$m=$mod->update();
		$m>0?header("Location:".URL."/detail/show"):"编辑失败";
	}

}