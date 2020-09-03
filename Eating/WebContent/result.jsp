<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>
<%
Map<String, Object> currentmember=(Map<String,Object>)session.getAttribute("currentmember");

List<Map<String, Object>> tbid = (List<Map<String, Object>>)request.getAttribute("tbid");
Map<String, Object> tc = (Map<String, Object>)request.getAttribute("tc");
Map<String, Object> userid= (Map<String, Object>)session.getAttribute("userid");
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>欢迎下次光临！</title>
		<link rel="icon" href="img/logo2.ico" type="image/x-icon" />
		<!--引入公共样式表-->
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
		<link rel="stylesheet" type="text/css" href="css/shoppingcar.css"/>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<style type="text/css">
			#main{
				width:1350px;
				height:360px;
				margin:0 auto;
				background-color:#efefef;
				border-radius:5px;
			}
			h2{
				text-align:center;
				color:#333;
				line-height:80px;
			}
			a.goon{
				display:block;
				text-align:center;
			}
		</style>
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

		<div id="carheader">
			<div id="carheaderwrapper" class="innerclass">
				<a href="index" id="carlogo"><img src="img/logo2.png" style="width: 60px;height:60px; "/></a>
				<span id="mycar">我的购物车</span>
				<span id="msg">温馨提示：商品是否购买成功，以下单为准，请尽快结算哦.</span>
			</div>
		</div>
		
		<!--主体开始-->
		<div id="main">
			<h2 style="padding-top: 50px;">下单成功!</h2>
			<a href="Index" class="goon">继续购物</a>
		</div>
		
		<!--主体结束-->
		
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
		
	</body>
</html>
