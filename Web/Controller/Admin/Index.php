<?php
//默认入口控制器Index

class Index extends Controller
{
    //默认加载方法
    public  function indexs()
    {
        //加载首页模板
        $this->display("index");
    }
     public  function left()
    {
        //加载左侧导航模板
        $this->display("left");
    }


     public  function bottom()
    {
        //加载页尾模板
        $this->display("bottom");
    }
    
    
    //加载页头
    public function top()
    {
        $this->display("top");
    }
    
    //加载swich
    public function swich()
    {
        $this->display("swich");
    }
    
    //加载主体内容
    public function main()
    {
        $this->display("main");
    }
}