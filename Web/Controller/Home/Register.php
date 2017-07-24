<?php
//
class Register extends Controller
{
    public function reg()
    {
        $this->display("reg");
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
			echo "恭喜你注册成功";
			header("Location:".URL."/logins/login");
		}else{
			echo "注册失败！";
			header("Location:".URL."/register/reg");
		}
	}
}