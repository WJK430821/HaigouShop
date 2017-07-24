<?php
//管理用户订单
class Order extends Controller
{
	
	//执行添加收货人信息和订单
	public function insert()
	{
		//获取订单信息
        $data['uid'] = $_SESSION['homeuser']['id']; //当前登录者的id号
        $data['linkman'] = $_POST['linkman'];
        $data['address'] = $_POST['address'];
        $data['code'] = $_POST['code'];
        $data['phone'] = $_POST['phone'];
        $data['email'] = $_POST['email'];
        $data['addtime'] = time();
        $data['total'] = $_SESSION['total'];
        $data['status'] = 0;
		$mod = new Model("orders");
		$m = $mod->insert($data);
		$m>0?header("Location:".URL."/buycat/flows"):"收货人信息保存失败！";

        //获取订单id号,并判断
        $oid = $mod->getPdo()->lastInsertId();
        
        if($oid>0){
            //执行订单详情添加
            $dmod = new Model("detail");
            //遍历购物车中的所有商品信息并添加到订单详情中
            foreach($_SESSION['shoplist'] as $shop){
                $dd = array();
                $dd['orderid'] = $oid;
                $dd['goodsid'] = $shop['id'];
                $dd['name'] = $shop['goods'];
                $dd['price'] = $shop['price'];
                $dd['num'] = $shop['m'];
                $dmod->insert($dd);
            }
            //清空购物车
            unset($_SESSION['shoplist']);
            unset($_SESSION['total']);
            header("Location:".URL."/order/over");
        }else{
            echo "订单添加失败！";
        }
	}

	//确认订单页
	public function checkorder()
	{
		$this->display("flow");
	}

	//加载订单成功页面
	public function over()
	{
        
		$this->display("flowcg");
	}
}