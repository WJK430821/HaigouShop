<?php
//购物车
class Buycat extends Controller
{
	public function __construct()
	{
		parent::__construct();
		if($_SESSION['homeuser']==""){
			header("Location:".URL."/logins/login");
			exit();
		}

	}
	//加载订单中心模板
	public function myorder()
	{
		$mod=new Model("orders");
		$uid=$_SESSION['homeuser']['id'];
		$sql="select * from orders where uid='{$uid}'";
		$this->olist=$mod->query($sql);
		//var_dump($this->olist);
		$this->display("myflow");
	}
	//执行会员删除订单
	public function delete()
	{
		$mod=new Model("orders");
		$m=$mod->del($_GET['id']);
		$m>0?header("Location:".URL."/buycat/myorder"):"删除失败！";
		//获取订单id号,并判断
    	$omod=new Model("detail");
    	$sql="delete from detail where orderid='{$_GET['id']}'";
    	$omod->query($sql);
        header("Location:".URL."/buycat/myorder");
		
	}

	//处理会员查看订单详情
	public function detail()
	{
		$mod=new Model("detail");
		$sql="select * from detail where orderid={$_GET['id']}";
		$this->myorder=$mod->query($sql);
		// echo "<pre>";
		// var_dump($this->myorder);
		$this->display("mydetail");
	}
	//个人收货地址
	public function myAddress()
	{
		$mod=new Model("users");
		$m=$mod->update();
		$m>0?header("Location:".URL."/buycat/myorder"):"修改失败";
		$this->display("myaddress");
	}
	//显示购物车信息
	public function show()
	{
		$this->display("mybuycat");
	}
	//加载核对订单信息页
	public function flows()
	{

		$this->display("flow");
	}

	//下单成功
	public function flowcg()
	{
		$this->display("flowcg");
	}
	//添加商品到购物车
	public function add()
	{
		$mod = new Model("goods");
		$id=$_GET['id'];
        $shop=$mod->find($id);
        $shop['m']=1;//初始化购买数量
        if(!empty($_SESSION['shoplist'][$id])){
            $_SESSION['shoplist'][$id]['m']+=1;
        }else{
            $_SESSION['shoplist'][$id]=$shop;//将购买的商品信息放入session中（购物车中
        }
        $this->display("cgbuy");
	}
	//编辑购物车信息
	public function edit()
	{
		$_SESSION['shoplist'][$_GET['id']]['m'] += $_GET['m'];
        //判断购买量是否合法
        if($_SESSION['shoplist'][$_GET['id']]['m']<1){
            $_SESSION['shoplist'][$_GET['id']]['m'] = 1;
        }
        header("Location:".URL."/buycat/show");
	}
	//清空购物车
	public function clear()
	{
		unset($_SESSION['shoplist']);
		header("Location:".URL."/buycat/show");
	}

	//删除购物车中一个商品
	public function del()
	{
		unset($_SESSION['shoplist'][$_GET['id']]);
		header("Location:".URL."/buycat/show");
	}
	
}