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
				padding: 20px;
			}
			.aa{
				line-height: 46.6px;
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
			.root{
				width: 100%;
				height: 180px;
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
			.wenben p{
				line-height: 23px;
				text-indent: 2em;
				margin-top: 5px;
			}
			.wenben h3{
				text-align: center;
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
				<p><h3>该吃饭了星选用户服务协议</h3></p>
				
				
				<p>[审慎阅读]您在申请注册流程中点击同意本协议之前，应当认真阅读本协议。请您务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款、
					法律适用和争议解决条款。免除或者限制责任的条款将以粗体下划线标识，您应重点阅读。如您对协议有任何疑问，可按照本协议中的联系方式向我们咨询，
					我们会为您做进一步解释和说明。</p>
				
				<p>[民事行为能力]您应当具备中华人民共和国法律规定的与您行为相适应的民事行为能力。如您未满18周岁或者不具备相应的民事行为能力，请您在法定监护人
					的陪同下阅读本服务协议，并在进行注册、下单、支付等任何行为或使用饿了么/饿了么星选平台其他任何服务前，应事先征得您法定监护人的同意。</p>
				
				<p >[签约动作]当您按照注册页面提示填写信息、阅读并同意本协议且完成全部注册程序后，即表示您已充分阅读、理解并接受本协议的全部内容，并与饿了么饿了么
					星选平台达成一致，成为饿了么饿了么星选平台的“用户”。在阅读本协议的过程中，如果您不同意本协议或其中任何条款约定，您应立即停止注册程序。</p>
				
				<p><h3>一.概述</h3></p>
				<p>第一条本服务协议双方为上海拉扎斯信息科技有限公司旗下网站“饿了么/饿了么星选”(下称“饿了么/饿了么星选") 与饿了么/饿了么星选平台用户
					(下称“用户”或“您) ,本服务协议具有合同效力。</p>
				
				<p >第二条饿了么饿了么星选平台经营者指经营饿了么/饿了么星选平台的法律主体，您可随时查看平台底部公示的证照信息以确定向您履约的饿了么饿了么星选主体。
					本协议项下，饿了么饿了么星选平台经营者可能根据平台的业务调整而发生变更，变更后的饿了么/饿了么星选平台经营者与您共同履行本协议并向您提供服务，
					饿了么饿了么星选平台经营者的变更不会影响您本协议项下的权益。发生争议时，您可根据您具体使用的服务及对您权益产生影响的具体行为对象确定与您履约的
					主体及争议相对方。</p>
				
				<p>第三条由于互联网高速发展，您与饿了么/饿了么星选签署的本服务协议列明的条款并不能完整罗列并覆盖您与饿了么/饿了么星选所有权利与义务，现有的约定也不能保证
					完全符合未来发展的需求。因此，饿了么饿了么星选平台的隐私权政策及其他各类规则为本协议的补充协议，与本协议不可分割且具有同等法律效力。如您
					使用饿了么饿了么星选平台服务，视为您同意上述补充协议。</p>
				
				<p>第四条根据国家法律法规变化、运营需要或为提升服务质量的目的，饿了么/饿了么星选将在必要的时候对上述各项协议、条款与规则进行修改更新，并通过在网页或移动客户端上发出公告、通知等合理、醒
				目的方式向您进行提前通知。您应当及时查阅并了解相关更新修改内容,如您不同意相关更新修改内容，可停止使用相关更新修改内容所涉及的服务,此情形下，更事项对您不产生效力;如您在上述更新修
				改内容实施后继续使用所涉及的服务，将视为您已同意各项更新修改内容。</p>
				
				
				<p><h3>二、定义</h3></p>
				<p>第五条饿了么饿了么星选的用户:户为惧完全民行为能力的自然人。无民事行为能力人、限制民事行为能力人不当注册为饿了么/饿了么星选用户或超过其民事权利或行为能力范围从事交易的，其与饿
				了么/饿了么星选之间的服务协议自始无效，饿了么/饿了 么星选-经发现， 有权立即注销该账号，并追究其使用饿了么/饿了么星选服务”的一-切法律责任。</p>
				
				<p>第六条用户注册是指用户登录饿了么/饿了么星选平台，并按要求填写相关信息并确认同意履行相关服务协议的过程。户因进行交易，获取订购商品的有偿服务或接触饿了么饿了么星选平台服务器而发生的
				所有应纳税赋，以及-切硬件、软件、服务及其他方面的费用均由用户负责支付。饿了么/饿了么星选平台仅作为网上订购的交易平台。</p>
				
				<p>第七条饿了么饿了么星选平台:由饿了么/饿了么星选自主开发，提供给用户进行网站上交易的平台软件，用户可以使用此系统进行订单管理、商户可以使用此系统进行店铺和外卖信息的发布和订单管理。</p>

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
