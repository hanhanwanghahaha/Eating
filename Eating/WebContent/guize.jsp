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
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>规则中心</title>
		<link rel="icon" href="img/logo2.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
		<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}
			
			.main{
				width: 1350px;
				margin: 0 auto;
		
			}
			.left{
				min-height: 50px;
			    width: 361px;
			    border: 1px solid #EEEEEE;
			    float: left;
			    /* margin-left: 10px; */
			    list-style: none;
			}
			.main left a:hover{
				background-color: #EEEEEE;
			}
			.right{
				min-height: 460px;
			    width: 965px;
			    float: left;
			    border: solid 1px #EEEEEE;
			    margin-left: 20px;
			}
			.wenben{
				width: 780px;
				min-height: 500px;
				margin: 0 auto;
			}
			.aa{
				line-height: 46.6px;
			}
			.aa:hover{
				background-color:#F7F7F7;
			}
			.bb{
				border-top: solid 1px #EEEEEE;
			}
			.word2{
				color: #333;
				text-decoration: none;
				margin-left: 20px;
				font-size: 16px;
				
			}
			.word2:hover{
				color: #006BC7;
			}
			.aa:hover{
				backgroud:#242424;
			}
			.root{
				width: 100%;
				height: 200px;
				background-color: #F7F7F7;
				margin: 0 auto;
				float: left;
				margin-top: 30px;
			}
			
			.h1{
				float: left;
				
				margin-left: 100px;
				margin-top: 30px;
			}
			.h1 a{
				text-decoration: none;
				color: #9F9F9F;
			}
			.r1{
				margin-left: 270px;
			}
			a{
				text-decoration: none;
				}
			ul{
				list-style: none;
			}
			.a01{
				height: 60px;
				display: block;
			    line-height: 60px;
			    background-color: #1e89e0;
			   
			}
			.a02{
				font-size: 16px;
			    color: #fff;
			    width: 104px;
			    text-align: center;
			    float: left;
			}
			.a01 span{
				float: left;
				color: #fff;
				margin-left: 150px;
			}
			.a01 a:hover{
				background-color: #006bc7
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
		<!--头部结束-->


	<!--主题开始 -->	
	<div class="main">
		<ul class="left">
			<li class="aa"><a class="word2" href="guize.jsp">营业资质</a></li>
			<li class="aa bb"><a class="word2" href="guizefen.jsp">用户协议</a></li>
			
		</ul>
		<div class="right">
			<div class="wenben">
				<img src="img/yingye.jpg"/>
			</div>
		</div>
	</div>
	<!--主题结束-->
		
		
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
