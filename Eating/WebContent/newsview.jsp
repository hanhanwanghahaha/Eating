 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>
<%
Map<String, Object> objbyid = (Map<String, Object>)request.getAttribute("objbyid");
%>
     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>该吃饭了！</title>
		<link rel="icon" href="img/logo2.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/newslist.css"/>
		 <link rel="stylesheet" type="text/css" href="css/index.css"/>
		 <link rel="stylesheet" type="text/css" href="css/newsview.css"/>
	</head>
	<body>
	 
		<div class="head">
			<div class="hbox"> 
				<p class="hbox1"><a href="##" >首页</a><a href="###">我的订单</a><a href="###">加盟合作</a><a href="###">我的客户</a></p>
				<p class="hbox2"> <a href="###" >规则中心</a><a href="###">手机应用</a><a href="###" >新闻资询</a> </p>
				
				<div class="navbox3">
						<ul class="menu">
							<li>
								KuGfFQElSWLp
								<div class="subnav">
									<a href="###">注册</a>
									<a href="###">重新登录</a>
									<a href="###">退出登录</a>
									<a href="###">案例四</a>
									<a href="###">案例五</a>
								</div>
							</li>
						</ul>
				</div> 
				<div class="navbox4">
						<ul class="menu">
							<li>
								产品系列
								<div class="subnav">
									<a href="###">水果</a>
									<a href="###">烤肉</a>
									<a href="###">火锅</a>
									<a href="###">蛋糕甜点</a>
									<a href="###">炒饭</a>
								</div>
							</li>
						</ul>
				</div> 
			</div>
		</div>
		<div class="logbox" style="overflow: hidden;">
			 <div class="pptbox" id="ppt01"  >
				<ul class="innerwrapper">
					<li><a href="#"><img src="img/6.jpg"/></a></li>
					 <li><a href="#"><img src="img/8.jpg"/></a></li>
					 <li><a href="#"><img src="img/6.jpg"/></a></li>
				</ul>
				<ul class="controls">
					<li class="current">1</li>
					<li>2</li>
					<li>3</li>
				</ul>			
				<span class="btnleft"></span>
				<span class="btnright"></span>
          </div>
			<div class="logbox1"> 
			<p><img src="img/1.jpg"/></p>
			<p class="log1"> <h3>融智黄焖鸡...</h3></p>
			
			</div>
			<div class="logbox2">
				<p><table border="0" style="line-height: 30px;text-align: center;">
								<tr><td><h5> 起送价</h5></td></tr>
								<tr><td><h3>8元</h3></td></tr>
								   
							</table>
							<table border="0" style="line-height: 30px;text-align: center;">
								<tr><td><h5> 配送费</h5></td></tr>
								<tr><td><h3>2元</h3></td></tr>
								   
							</table>
							<table border="0" style="line-height: 30px;text-align: center;">
								<tr><td><h5> 平均送达时间</h5></td></tr>
								<tr><td><h3> 30分钟</h3></td></tr>
								   
							</table></p>
			</div>
		</div>
		
		
 
 <div class="main">
			<p class="path">当前位置:融智信息>校园新闻 </p>
			<div class="leftnav">
				<a href="UiNewsList?typenname=1" style="border-top: solid 1px #eee;">学校公告</a>
				<a href="UiNewsList?typenname=2">菁菁校园</a>
				<a href="UiNewsList?typenname=3">学校趣闻</a>
				<a href="UiNewsList?typenname=4">班级通知</a>
				<a href="UiNewsList?typenname=5">数学建模</a>
				<a href="UiZhaoPingList?typenname=7">校园招聘</a>
			</div>
			<div class="rightlist">
				<h3><%=objbyid.get("tbtitle")%></h3>
				<p class="info">作者：<%=objbyid.get("tbauthor")%>  来源：<%=objbyid.get("tbsource")%> 发布时间：<%=objbyid.get("tbcreatetime")%></p>
				<div class="contents">
				<img src="upload/<%=objbyid.get("imgurl")%>" style="max-width:800px;"/>
				<br/>
				
					<%=objbyid.get("tbcontents")%>	 
			</div>
			 
			  </div>
			<div style="clear: both;"></div>
		</div>
		
		
		<div class="rootbox">
			<div class="rootbox1">
				<p><h3 style="color: #31302B;">用户帮助</h3></p>
				<p><a href="##"> 我的客户</a></p>
			</div>
			<div class="rootbox2">
				<p><h3 style="color: #31302B;"> 商务合作</h3></p>
				<p><a href="##">我要开店</a></p>
				<p><a href="##">加盟指南</a></p>
				<p><a href="##">市场合作</a></p>
				<p><a href="##">开放平台</a></p>
			</div>
			<div class="rootbox3">
				<p><h3 style="color: #31302B;">关于我们</h3></p>
				<p><a href="##">该吃饭了介绍</a></p>
				<p><a href="##">加入我们</a></p>
				<p><a href="##">联系我们</a></p>
				<p><a href="##">规则中心</a></p>
				<p><a href="##">隐私政策</a></p>
			</div>
			<div class="rootbox4">
				<p>24小时服务热线：101010100</p>
				<p><a> 关注我们：</a><a href="##"> <img src="img/4.png"/></a>  <a href="##"><img src="img/5.png"/></a></p>
			
			</div>
			<div class="rootbox5">
				<p><img src="img/1.jpg"/></p>
			</div>
			<div class="rootbox6">
				<p><h4 style="color: #31302B;">下载手机版</h4></p>
				<p><a>点餐更方便</a></p>
			</div>
			 
		</div>
		
		<div id="carbox">
			 <div class="leftnavbox">
				<ul class="menubox">
					<li><a href="###"> <img src="img/9.jpg" /></a>
					 <div class="submenu"> <p id="pronum">0</p></div>
					 
					</li>				 
				</ul>
			</div>
			  <p><input   type="submit" value="提交购物车" class="button3"/></p>
			 
		</div>
		 
		<script src="js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/tyslide.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$("p.p4").click(function(){
				var proid=$(this).attr("data-id");
				$.ajax({
				    url:'uiaddtocar', //要请求的url地址
				    type:'POST', //请求方法 GET or POST
				    async:true, //是否使用异步请求的方式
				    timeout:5000, //请求超时的时间，以毫秒计
				    data:{
				        id:proid
				    },
				    dataType:'json', //预期的服务器返回参数类型
				    beforeSend:function(){
				        
				    },//再发送请求前调用的方法
				    success:function(data) {
				    	console.log(data);
				       alert("加入成功");
				       
				    }, //请求成功时回调方法，data为服务器返回的数据
				    error:function(){
				       
				    }, //请求发生错误时调用方法
				    complete:function(){
						
				    } 
				});
				
				
				
			});
			$(".button1").click(function(){
				var id=$(this).attr("data-id");
				//发送数据给后端
				var v=$("#pronum").text();
				var v=parseInt(v);
				v++;
				$("#pronum").text(v);
				
			});
			
			$(".button2").click(function(){
				var id=$(this).attr("data-id");
				//发送数据给后端
				var v=$("#pronum").text();
				var v=parseInt(v);
				if(v>=1){
				v--;}
				$("#pronum").text(v);
				 
				
			});
			
			$("#ppt01").tyslide({
				boxh:170,//盒子的高度
				w:1350,//盒子的宽度
				h:170,//图片的高度
				isShow:true,//是否显示控制器
				isShowBtn:true,//是否显示左右按钮
				controltop:5,//控制按钮上下偏移的位置,要将按钮向下移动   首先保证boxh 高度>图片 h
				controlsW:60,//控制按钮宽度
				controlsH:10,//控制按钮高度
				radius:0,//控制按钮圆角度数
				controlsColor:"#eee",//普通控制按钮的颜色
				controlsCurrentColor:"#ff6600"//当前控制按钮的颜色
			});			
</script>

	</body>
</html>
		