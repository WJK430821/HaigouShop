<?php
class Index extends Controller
{
    //默认加载方法
    public  function indexs()
    {
        $mod=new Model("goods");
        //调用最新商品4条
    	$sql="select * from goods order by addtime desc limit 4";
        $this->newlist=$mod->query($sql);
        //加载首页模板
        //调用美食二级分类
        $msmod=new Model("type");
        $sql="select * from type where pid=30";
        $this->meislist=$msmod->query($sql);
        $this->display("index");
    }

    //加载商品列表页
    public function list()
    {
        $mod = new Model("goods");
        //判断封装搜索条件
        if(!empty($_GET['tid'])){
            $mod->where("typeid in(select id from type where path like '%,{$_GET['tid']},%')");
        }
        //实例化分页对象
        $page = new Page($mod->count(),8);
        //执行搜索查询
        $this->goodslist = $mod->limit($page->limit())->select();
        
        $this->page = $page->show();
    	$this->display("goods_list");
    }

    //友情链接

    //详情页
    public function show()
    {
        $mod=new Model("goods");
        $this->goods=$mod->find($_GET['id']+0);
        $this->goods['clicknum']++;
        $mod->update($this->goods);
        $this->display("show");
    }


}
