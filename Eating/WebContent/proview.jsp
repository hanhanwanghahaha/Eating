<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>
<%
		Map<String, Object> currentmember=(Map<String,Object>)session.getAttribute("currentmember");
		
  		Map<String, Object> objbyid =(Map<String, Object>)request.getAttribute("objbyid");
  		Map<String, Object> userid= (Map<String, Object>)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>加入购物车吧！</title>
		<link rel="icon" href="img/logo2.ico" type="image/x-icon" />
		<style type="text/css">
			.mainboxtu1 .w1{
				width: 50px;
				height: 50px;
				background-color: blue;
			}
			.mainboxtu11{
				width: 435.5px;
				height: 20%;
				background-color: red;
			}
		</style>
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/shoppingcar.css"/>
		<link rel="stylesheet" type="text/css" href="css/productview.css"/>
	</head>
	<body>
		<div class="head">
			<div class="hbox"> 
				<p class="hbox1">
					<a href="Index" >首页</a>
					<a href="Dingdan?id=<%=userid.get("id") %>">我的订单</a>
					<a href="###">加盟合作</a><a href="###">我的客户</a>
				</p>
				<p class="hbox2"><a href="guize.jsp" >规则中心</a><a href="uiaddtocar">我的购物车</a><a href="###" >新闻资讯</a> </p>
				
				<div class="navbox3">
						<ul class="menu">
							<li>
								<%=userid.get("loginname")%>
								<div class="subnav">
									<a href="ShopingDelete">退出登录</a>
								</div>
							</li>
						</ul>
				</div> 
				<div class="navbox4">
						<ul class="menu">
							<li>
								产品系列
								<div class="subnav">
									<a href="###">川菜</a>
									<a href="###">粤菜</a>
									<a href="###">苏菜</a>
									<a href="###">浙菜</a>
									<a href="###">徽菜</a>
									<a href="###">闽菜</a>
									<a href="###">鲁菜</a>
									<a href="###">湘菜</a>
								</div>
							</li>
						</ul>
				</div> 
			</div>
		</div>
		 
		 
		 <div id="main" class="innerclass">
			<p id="title"><%=objbyid.get("cainame") %><span id="rightspan"><a href="###">概述</a> | <a href="###">图集</a> | <a href="###">参数</a> | <a href="###">评论</a></span> </p>
			<div id="proview">
				<img src="upload/<%=objbyid.get("imgurl")%>"/>
				<div id="proviewdescription">
					<h3 id="h3"><%=objbyid.get("cainame") %></h3>
					<div class="briefdiv">
						<p class="p1">
							<span>
								<%=objbyid.get("kind") %>
							</span>
						</p>
						<p class="p1">
							<span>特色：<%=objbyid.get("brief") %></span>
						</p>
						<p><span style="font-size:12px;color:#3091f2;">sid：<%=session.getId()%> </span></p>
						<p class="price">总价：<%=objbyid.get("price") %> 元</p>
					</div>
					<button class="btnaddtocar" data-proid=<%=objbyid.get("id") %> id="btnaddtocar">加入购物车</button>
					<p class="reback">10分钟内可以退款</p>
				</div>
			</div>
			<h2>菜品详细介绍</h2>
			<div id="list">
				<%=objbyid.get("brief") %> 
			</div>
		</div>

		<!--尾部开始-->
		<div class="root">
			<div class="word">
				<div class="r1 h1">
					<p><h3 style="color: #31302B;">用户帮助</h3></p>
					<p><a href="##"> 我的客户</a></p>
				</div>
				<div class="r2 h1">
					<p><h3 style="color: #31302B;"> 商务合作</h3></p>
					<p><a href="##">我要开店</a></p>
					<p><a href="##">加盟指南</a></p>
					<p><a href="##">市场合作</a></p>
					<p><a href="##">开放平台</a></p>
					 
				</div>
				<div class="r3 h1">
					<p><h3 style="color: #31302B;">关于我们</h3></p>
					<p><a href="##">该吃饭了介绍</a></p>
					<p><a href="##">加入我们</a></p>
					<p><a href="##">联系我们</a></p>
					<p><a href="##">规则中心</a></p>
					<p><a href="##">隐私政策</a></p>
				</div>
				<div class="r4 h1">
					<p>24小时服务热线：101010100</p>
					<p><a>关注我们：</a><a href="##"> <img src="img/logo2.png" style="width: 40px;height:40px; "/></a>  <a href="##"><img src="img/5.png"/></a></p>
				</div>
				<div class="r5 h1">
					<p><img src="img/logo2.png" style="width: 80px;height:80px; "/></p>
					<p><h4 style="color: #31302B;">下载手机版</h4></p>
					<p><a>点餐更方便</a></p>
				</div>
		</div>

		<!--尾部结束-->
		<!--引入jq库 -->
		<script src="js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<!--引入轮播的插件  插件就是具有一定结构和功能的代码 注意:先进入jq库 ,后引入插件文件 -->
		<script src="js/tyslide.js" type="text/javascript" charset="utf-8"></script>
		
		<script type="text/javascript">
			
			$("#ppt01").tyslide({
				boxh:460,//盒子的高度
				w:992,//盒子的宽度
				h:460,//图片的高度
				isShow:true,//是否显示控制器
				isShowBtn:true,//是否显示左右按钮
				controltop:10,//控制按钮上下偏移的位置,要将按钮向下移动   首先保证boxh 高度>图片 h
				controlsW:60,//控制按钮宽度
				controlsH:10,//控制按钮高度
				radius:5,//控制按钮圆角度数
				controlsColor:"#FECA14",//普通控制按钮的颜色
				controlsCurrentColor:"#FF6700"//当前控制按钮的颜色
			});	
			
			$("#btnaddtocar").click(function(){
				var proid=$(this).attr("data-proid");
				$.ajax({
				    url:'uiaddtocar', //要请求的url地址
				    type:'POST', //请求方法 GET or POST
				    async:true, //是否使用异步请求的方式
				    timeout:5000, //请求超时的时间，以毫秒计
				    data:{
				        id :proid
				    },
				    dataType:'json', //预期的服务器返回参数类型
				    beforeSend:function(){
				        
				    },//再发送请求前调用的方法
				    success:function(data) {
				        console.log(data);
				        location.href="uiaddtocar";
				    }, //请求成功时回调方法，data为服务器返回的数据
				    error:function(){
				       
				    }, //请求发生错误时调用方法
				    complete:function(){
				    	
				    } 
				});
			});
		</script>
	</body>
</html>
