<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>
<%
Map<String, Object> currentmember=(Map<String,Object>)session.getAttribute("currentmember");

List<Map<String, Object>> lists = (List<Map<String, Object>>)request.getAttribute("lists");
String pagestr= (String)request.getAttribute("pagestr");
List<Map<String, Object>> item2 = (List<Map<String, Object>>)request.getAttribute("item2");
Map<String, Object> userid= (Map<String, Object>)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>八大菜系任你挑！</title>
		<link rel="icon" href="img/logo2.ico" type="image/x-icon" />
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/scrolltopcontrol.js"></script>
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
	</head>
	<body>
		<div class="head">
			<div class="hbox"> 
				<p class="hbox1"><a href="Index" >首页</a><a href="dingdan.jsp">我的订单</a><a href="###">加盟合作</a><a href="###">我的客户</a></p>
				<p class="hbox2"><a href="guize.jsp" >规则中心</a><a href="shoppingcar.jsp">我的购物车</a><a href="###" >新闻资讯</a> </p>
				
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
		<div class="logbox" style="overflow: hidden;">
			 <div class="pptbox" id="ppt01"  >
				<ul class="innerwrapper">
					<li><a href="#"><img src="img/ppt1.jpg"/></a></li>
					<li><a href="#"><img src="img/ppt2.jpg"/></a></li>
					<li><a href="#"><img src="img/ppt3.jpg"/></a></li>
					<li><a href="#"><img src="img/ppt4.jpg"/></a></li>
					<li><a href="#"><img src="img/ppt5.jpg"/></a></li>
					<li><a href="#"><img src="img/ppt6.jpg"/></a></li>
					<li><a href="#"><img src="img/ppt7.jpg"/></a></li>
					<li><a href="#"><img src="img/ppt8.jpg"/></a></li>
					<li><a href="#"><img src="img/ppt9.jpg"/></a></li>
				</ul>
				<ul class="controls">
					<li class="current">1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
					<li>5</li>
					<li>6</li>
					<li>7</li>
					<li>8</li>
					<li>9</li>
				</ul>				
				<span class="btnleft"></span>
				<span class="btnright"></span>
          </div>
			<div class="logbox1"> 
			<p><a href="Index"><img src="img/logo2.png" style="width: 150px;height:150px; "/></a></p>
			<p class="log1"><a href="Index" style="color:#343434"><h3>中国传统饮食文化</h3></a></p>
			
			</div>
			<div class="logbox2">
				<p><table border="0" style="line-height: 30px;text-align: center;">
								<tr><td><h5>起送价</h5></td></tr>
								<tr><td><h4>8元</h4></td></tr>
								   
							</table>
							<table border="0" style="line-height: 30px;text-align: center;">
								<tr><td><h5> 配送费</h5></td></tr>
								<tr><td><h4>2元</h4></td></tr>
								   
							</table>
							<table border="0" style="line-height: 30px;text-align: center;">
								<tr><td><h5> 平均送达时间</h5></td></tr>
								<tr><td><h4> 30分钟</h4></td></tr>
								   
							</table></p>
			</div>
		</div>
		
		<div class="reasechbox">
			<div class="reasechbox1">
				<p><a href="###" >所有商品 </a><span>|</span><a href="###">评价 </a><span>|</span><a href="###">商家资质</a></p> 
			 
			</div>
			<div class="reasechbox2">
				<p><a href="###">默认排序 </a><span>|</span><a href="###">评分  </a><span>|</span><a href="###">销量 </a><span>|</span><a href="###">价格</a></p>
			</div>
			<div class="reasechbox3">
				<p><input type="text" class="input_text" placeholder="请输入搜索内容"><!-- -->
			    <input type="submit" value="搜索" class="input_sub"></p>
			</div>
		</div>
		<div class="navbox">
			<p>
				<a href="##">热销</a><a href="##">优惠</a>
				<a href="##">东坡肉</a><a href="##">火烧马鞍桥</a>
				<a href="##">龙虎斗</a><a href="##">潮州火筒炖鲍翅</a>
				<a href="##">樟茶鸭子</a><a href="##">霸王别姬</a>
				<a href="##">佛跳墙</a><a href="##">梅开二度</a>
			</p>	
		</div>
		<div class="mainbox">
			<!--<p class="mainbox1"><img src="img/7.jpg" /></p>-->
			<p class="mainbox2">八大菜系任你挑</p>
		</div>
		<div class="mainboxppt">
			<table border="1" id="td1" cellpadding="0" cellspacing="0">
			<tr class="a1">
				<td><a href="uicailist?typenname=1">川菜</a></td>
				<td><a href="uicailist?typenname=2">粤菜</a></td>
				<td><a href="uicailist?typenname=3">苏菜</a></td>
				<td><a href="uicailist?typenname=4">浙菜</a></td>
				<td><a href="uicailist?typenname=5">徽菜</a></td>
				<td><a href="uicailist?typenname=6">闽菜</a></td>
				<td><a href="uicailist?typenname=7">鲁菜</a></td>
				<td><a href="uicailist?typenname=8">湘菜</a></td>
			</tr>	 
		</table>
		</div>
		<div class="mainboxtu">
		<%for (Map<String, Object> m : lists) { %>
			<div class="mainboxtu1">
				<div class="boxtu01" ><a href="uiproview?id=<%=m.get("id")%>"><img src="img/chuan.jpg" /></a></div>
				<div class="boxtu02">
					<p><a href="proview.html">菜系：<%=m.get("kind")%></a></p>
					<p><a href="shoppingcar?id=<%=m.get("id")%>">菜名：<%=m.get("cainame")%></a></p>
					<p><a href="proview.html">价格：<%=m.get("price")%>元</a></p>
					<p class="p5" data-id="<%=m.get("id")%>"><a href="javascript:void(0);">特色：<%=m.get("brief")%></a></p>
				</div>
			</div>
			  <%} %>
		</div>
		 
		
		
		<div class="logmainbox">			 
			<p> 最受欢迎</p>
		</div>
		<div class="logmainbox3">
		<%for (Map<String, Object> m : lists) { %>
			<div class="logmainbox31">
				<div class="mainbox32"><a href="uiproview?id=<%=m.get("id")%>"><img src="img/chuan5.jpg" /></a></div>
				<div class="mainbox33">
					<a href="proview.html">
						<a href="shoppingcar?id=<%=m.get("id")%>"><span>菜名：<%=m.get("cainame")%></span></a>
						<span class="p4">菜系：<%=m.get("kind")%></span>
						<span> 价格：<%=m.get("price")%></span><span>特色:<%=m.get("brief")%></span>
						 
					</a>
				</div>
			</div>
			 <%} %> 
		</div>
		
		 
		
		
		<div class="news">
			<div class="navmainbox">
				 <p class="navmainbox1">
				 	 <a class="a1">N W E S</a>
				 	  <a class="a2">新闻与活动</a>
				 	  <a  href="###" class="a3">更多</a>
				 </p>		 
			</div>
			<div class="navboxlog">
				 <p class="p1"><img src="img/logo2.png" style="width: 80px;height:80px; "/></p>
				<div class="p2">
					<p>新闻动态</p>
					<ul>
					<li><a href="##">台风后深圳首个上班日 <span> 2019-12-22</span></a></li>
					<li><a href="##">台风后深圳首个上 <span> 2019-12-22</span></a></li>
					<li><a href="##">台风后深圳首个上班日<span> 2019-12-22</span></a></li>
					<li class="l"><a href="##">台风后深圳首个上班日 <span> 2019-12-22</span></a></li> 
				</ul>	
				</div>	 
				<p class="p3"><img src="img/logo2.png" style="width: 80px;height:80px; "/></p>	  
				 <div class="p4">
				 	<p>活动</p>
					<ul>
					<li><a href="##">台风后深圳首个上班日 <span> 2019-12-22</span></a></li>
					<li><a href="##">台风后深圳首个上班日<span> 2019-12-22</span></a></li>
					<li><a href="##">台风后深圳首个上班日 <span> 2019-12-22</span></a></li>
					<li class="l"><a href="##">台风后深圳首个上班日  <span> 2019-12-22</span></a></li>	 
				</ul>
				</div>	
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
					<p><a>关注我们：</a><a href="##"> <img src="img/logo2.png" style="width: 60px;height:60px; "/></a>  <a href="##"><img src="img/5.png"/></a></p>
				</div>
				<div class="r5 h1">
					<p><img src="img/logo2.png" style="width: 80px;height:80px; "/></p>
					<p><h4 style="color: #31302B;">下载手机版</h4></p>
					<p><a>点餐更方便</a></p>
				</div>
		</div>

		<!--尾部结束-->
		<link rel="stylesheet" href="http://cdn.jisuapp.cn/zhichi_frontend/static/new_upper_right_corner/css/new_upper_right_corner.css?version=11044">
		<script id="qd2852151828c1fdcdf5d7fe54a62ca13fd41e940060" src="https://wp.qiye.qq.com/qidian/2852151828/c1fdcdf5d7fe54a62ca13fd41e940060" charset="utf-8" async defer></script>
		<div class="online-service">
		  <div class="service-head">
		    <div class="service-head-inner">
		      <img src="http://cdn.jisuapp.cn/zhichi_frontend/static/consult_contact/bg_1.png" alt="">
		      <img src="http://cdn.jisuapp.cn/zhichi_frontend/static/consult_contact/bg_2.png" alt="">
		      <img src="http://cdn.jisuapp.cn/zhichi_frontend/static/consult_contact/bg_3.png" alt="">
		      <img src="img/5.png" alt="">
		      <img class="service-head-ball" src="http://cdn.jisuapp.cn/zhichi_frontend/static/consult_contact/ball.png" alt="">
		      <div class="online-service-infortip">
		      <span>Hello,欢迎来咨询噢~</span>
		      </div>
		    </div>
		  </div>
		
		  <div class="service-content-wrap">
		    <p class="service-phone"><span>微信：</span>222222222</p>
		    <p>QQ：23333333</p>
		        <p id="online-service-inner"><a class="exclusive-service" rel="nofollow"><img
		          src="http://cdn.jisuapp.cn/zhichi_frontend/static/consult_contact/message_normal.png" alt=""> 在线客服</a></p>
		            <p id="vip-service"><a href="/vip/" rel="nofollow"><img src="http://cdn.jisuapp.cn/zhichi_frontend/static/consult_contact/package_normal.png" alt="">
		      套餐咨询</a>
		    </p>  
		  </div>
		</div>
		<!--<div id="carbox">
			<div class="leftnavbox">
				<ul class="menubox">
					<li>
						<a href="###"> <img src="img/9.jpg" /></a><div class="submenu"> <p id="pronum">0</p></div>
					</li>				 
				</ul>
			</div>
			<p><input type="submit" value="提交购物车" class="button3"/></p>	 
		</div>-->
		<script src="js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/tyslide.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		$(".p4").click(function(){
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
				v--;
				$("#pronum").text(v);
				 
				
			});
			
			$("#ppt01").tyslide({
				boxh:320,//盒子的高度
				w:1350,//盒子的宽度
				h:320,//图片的高度
				isShow:true,//是否显示控制器
				isShowBtn:true,//是否显示左右按钮
				controltop:5,//控制按钮上下偏移的位置,要将按钮向下移动   首先保证boxh 高度>图片 h
				controlsW:60,//控制按钮宽度
				controlsH:10,//控制按钮高度
				radius:0,//控制按钮圆角度数
				controlsColor:"#eee",//普通控制按钮的颜色
				controlsCurrentColor:"#3091f2"//当前控制按钮的颜色
			});			
		</script>
	</body>
</html>
