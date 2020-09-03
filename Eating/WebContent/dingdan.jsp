<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>
<%
Map<String, Object> currentmember=(Map<String,Object>)session.getAttribute("currentmember");

List<Map<String, Object>> lists = (List<Map<String, Object>>)request.getAttribute("lists");
String pagestr= (String)request.getAttribute("pagestr");
Map<String, Object> userid= (Map<String, Object>)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的订单</title>
		<link rel="icon" href="img/logo2.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/main.css"/>	
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
		<link rel="stylesheet" type="text/css" href="css/shoppingcar.css"/>
		<style type="text/css">
			.innerclass {
			    width: 1350px;
			    margin: 0 auto;
			}
			.b01-2 a{
				color:#333;
			}
			.b01-2 a:hover{
				color:#3091f2;
			}
			.b02-4{
				float:left;
				width:277px;
				height:200px;
				background-color:#f4f4f4;
				margin:10px;
				border:1px solid #FFFFFF;
				border-radius:20px;
				
			}
			.b02-4:hover{
				box-shadow: 0 0 25px rgba(0,0,0,0.3);
			}
			.b02-4 p{
				line-height:40px;
				padding-left:10px;
				color:#333;
			}
		</style>
	</head>
	<body>
		<!--头部开始-->
		<div class="head">
			<div class="hbox"> 
				<p class="hbox1">
					<a href="Index" >首页</a>
					<a href="Dingdan?id=<%=userid.get("id") %>">我的订单</a>
					<a href="###">加盟合作</a><a href="###">我的客户</a>
				</p>
				<p class="hbox2">
					<a href="guize.jsp" >规则中心</a><a href="uiaddtocar">我的购物车</a><a href="###" >新闻资讯</a> 
				</p>
				
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
		<!--头部结束-->
		<div id="carheader" style="margin:center;">
			<div id="carheaderwrapper" class="innerclass">
				<a href="Index" id="carlogo"><img src="img/logo2.png" style="width: 65px;height:65px;"/></a>
				<span id="mycar">我的订单</span>
			</div>
		</div>
		<div id="main">
			<div class="b01">
			<ul class="" >
				<li class="b01-2"><h2 ><a href="Geren?id=<%=userid.get("id") %>" >个<br/>人<br/>中<br/>心<br/></a></h2></li>
				<li class="b01-2"><h2 ><a href="Dingdan?id=<%=userid.get("id") %>" >我<br/>的<br/>订<br/>单<br/></a></h2></li>
			</ul>
			</div>
		
			<div class="b02">
				<p class="b02-3" style="height:40px;line-height:40px;background-color:#f4f4f4;font-size:18px;padding-left:10px;">
					我的订单
				</p>
					<%for (Map<String, Object> m : lists) { %>
						<a href="/Eating/DingdanXX?orderid=<%= m.get("orderid") %>">
						<div class="b02-4">
							<p>取餐者：<span style="color:#3091f2"><%=m.get("sname") %></span></p>
							<p>下单时间：<span style="color:#3091f2"><%=m.get("ctime") %></span></p>
							<p>点餐费用：<span style="color:#3091f2">￥<%=m.get("sumprice") %>元</span></p>
							<p>地址：<span style="color:#3091f2">重庆工商大学融智学院<%=m.get("saddress") %>栋</span></p>
							<p>门牌号：<span style="color:#3091f2"><%=m.get("saddress2") %></span></p>
						</div></a>
					<% } %>	
			</div>
			
		</div>
		<div style="clear: both;"></div>
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
					<p><a>关注我们：</a><a href="##"> <img src="img/logo2.png" style="width: 60px;height:60px; "/></a>  <a href="##"><img src="img/5.png"/></a></p>
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
