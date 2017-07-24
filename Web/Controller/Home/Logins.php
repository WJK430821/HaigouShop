<?php
//登录
class Logins extends Controller
{

	//加载登录模版
	public function login()
	{
		$this->display("login");
	}

	//执行登录
    public function doLogin()
    {
        //验证账号和密码
        $mod = new Model("users");
        $pass = md5($_POST['pass']);
        $sql = "select * from users where username='{$_POST['username']}' and pass='{$pass}'";
        $list = $mod->query($sql);

        if(count($list)>0){
            //获取登录者信息并放入到session中
            $_SESSION['homeuser'] = $list[0];
            //跳转到网站首页
            header("Location:".URL);
        }else{
            $this->errinfo = "登录账号或密码错误！";
            $this->display("login"); 
        }
    }

    //执行退出
    public function logout()
    {
        unset($_SESSION['homeuser']); //销毁登录成功的储存信息
        header("Location:".URL);
        $this->display("login");
    }


    
}