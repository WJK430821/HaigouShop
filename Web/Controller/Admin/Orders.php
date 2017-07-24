<?php
//订单
class Orders extends Controller
{
	public function show()
	{
		$mod=new Model("orders");
		//判断要查询的订单信息
		if(!empty($_GET['id'])){
			$mod->where("id='{$_GET['id']}'");
		}
		if(!empty($_GET['uid'])){
			$mod->where("id='{$_GET['uid']}'");
		}
		if(!empty($_GET['linkman'])){
			$mod->where("linkman like '%{$_GET['linkman']}%'");
		}
		if(!empty($_GET['phone'])){
			$mod->where("phone like '%{$_GET['phone']}%'");
		}
		//实例化分页对象
        $page = new Page($mod->count(),10);
        //执行搜索查询
        $this->list = $mod->limit($page->limit())->select();
        $this->page = $page->show();
		$this->display("show");
	}

	// public function del()
	// {
	// 	$mod=new Model("orders");
	// 	$m=$mod->del($_GET['id']);
	// 	$m>0?header("Location:".URL."/orders/show"):"删除失败！";
	// }

	//编辑
	public function edit()
	{
		$mod=new Model("orders");
		$this->m=$mod->find($_GET['id']);
		$this->display("edit");
	}

	public function update()
	{
		$mod=new Model("orders");
		$m=$mod->update();
		$m>0?header("Location:".URL."/orders/show"):"编辑失败";
	}

	//订单详情
	public function detaisi()
	{
		$mod=new Model("detail");
		$sql="select * from detail where orderid='{$_GET['id']}'";
		$this->orderlist=$mod->query($sql);
		$this->display("detais");
	}
}