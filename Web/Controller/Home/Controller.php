<?php
//控制器类的基类（父类）
class Controller
{
    //构造方法
    public function __construct()
    {
        $_SESSION['homeuser']=="";
        //加载页头信息
        $tpmod=new Model("type");
        $tplist=$tpmod->where("pid=0")->select();
        //查询所有根类别信息
          //遍历一级类别信息，并获取它们的每个子类别信息，使用zlist下标存储
        foreach($tplist as &$vo){
            $vo['zlist']=$tpmod->where("pid=".$vo['id'])->select();//获取二级类别信息
        }
        $this->tplist=$tplist;//将获取的商品类别信息放置到当前对象中




        //加载友情链接
        $linkmod=new Model("links");
        $llist=$linkmod->select();
        $this->links=$llist;

        //加载商品推荐
        $hotmod=new Model("goods");
        $sql="select * from goods where iscomm=1 limit 4";
        $this->hotlist=$hotmod->query($sql);

        //新品
        $newmod=new  Model("goods");
        $sql="select * from goods order by addtime desc limit 4";
        $this->newlist=$newmod->query($sql);
        //爆款
        $clickmod=new Model("goods");
        $sql="select * from goods order by clicknum desc limit 4";
        $this->clicklist=$clickmod->query($sql);

        //美食
        $msmod=new Model("goods");
        $sql="select * from goods where typeid in(select id from type where path like '%,30,%') order by addtime desc limit 4";
        $this->mslist=$msmod->query($sql);
        //print_r($this->mslist);die();
        //男女服装
        $fzmod=new Model("goods");
        $sql="select * from goods where typeid in(select id from type where path like '%,1,%') order by addtime desc limit 4";
        $this->nvlist=$fzmod->query($sql);

        $msmod=new Model("goods");
        $sql="select * from goods where typeid in(select id from type where path like '%,30,%') order by clicknum desc limit 4";
        $this->msglist=$msmod->query($sql);
        //首页男女服装排行
        $fuzmod=new Model("goods");
        $sql="select * from goods where typeid in(select id from type where path like '%,1,%') order by clicknum desc limit 4";
        $this->fuzolist=$fuzmod->query($sql);
        // echo "<pre>";
        // var_dump($this->msglist);
    }
    //负责执行子类中的方法
    public function run($method){
        //判断方法是否存在
        if(method_exists($this,$method)){
            $this->$method();//调用此方法 
        }else{
            die("<h2>你调用的方法{$method}不存在！</h2>");
        }
    }
    
    //加载模板方法
    public function display($tpl)
    {
        //获取当前控制器类名，作为模板加载路径的一部分
        $cname = CONTROLLER; //get_class($this);
        require("./Web/View/Home/{$cname}/".$tpl.".html");
        
    }
}


