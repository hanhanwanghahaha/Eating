<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>
<%
Map<String, Object> id= (Map<String, Object>)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>"该吃饭了"校园外卖后台系统V1.0</title>
		<link rel="stylesheet" type="text/css" href="../admin/css/comm.css" />
		<link rel="stylesheet" href="css/flipclock.css">
	    <link rel="stylesheet" href="css/style03.css">
		<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}
			.linear {
				position: relative;
				width: 100%;
				min-height: 100px;
				background-image: url(../img/login_back.jpg);
			}
			
			.nav {
				width: 100%;
				height: 34px;
				list-style: none;
				background-color: white;
				border-bottom: solid 1px #0044C0;
			}
			
			.nav li {
				float: left;
				height: 30px;
				position: relative;
				background-color:#79C701;
				margin-right: 3px;
				margin-top: 2px;
				border-top-left-radius: 0px;
				border-top-right-radius: 15px;
				background-image: url(admin_img/aixin.png);
				background-repeat: no-repeat;
				background-position: 1px 6px;
			}
			
			.nav li a {
				text-decoration: none;
				padding: 0 20px;
				line-height: 30px;
				color: white;
				display: block;
			}
			
			.timeanduser {
				width:480px;
				text-align: right;
				height: 60px;
				position: absolute;
				right:5px;
				top: 15px;
				font-size: 12px;
				padding-right: 10px;
				padding-top: 10px;
				color: white;
				border: 1px;
				border-radius: 20px;
				background-color:#79C701;
				border-bottom-right-radius: 0;
				border-top-right-radius: 0;
				box-shadow: 2px 2px 15px 2px #fff;
				line-height: 22px;
			}
			
			#currentuser{
				/*background-image: url(img/logout.png);*/
				background-repeat: no-repeat;
				background-size:18px auto;
				background-position:right 5px;
				padding-right: 30px;
                position:relative;
			}
		    #logout {
		    
            }
             #logout  img{
		        width:20px;
                height:20px;
                position:absolute;
                right:0px;
                top:1px;
            }
		</style>

	</head>

	<body>
		<form name="form1" method="post" action="top.aspx" id="form1">
			<div class="linear">
				<img src="admin_img/admin_logo.png" style="height:72px;width:72px;position: absolute;top:15px;left:15px" />
				<img src="admin_img/logo_2.png" style="height:70px;position: absolute;top:15px;left:85px;" />
			</div>
			<ul class="nav">
				
                        <li>
					        <a href="left.jsp?id=1" target="left">管理员中心</a>
				        </li>
                    
                        <li>
					        <a href="left.jsp?id=2" target="left">用户中心</a>
				        </li>
                    	
                        <li>
					        <a href="left.jsp?id=3" target="left">菜品中心</a>
				        </li>
                        <li>
					        <a href="left.jsp?id=4" target="left">订单中心</a>
				        </li>  
				        <li>
					        <a href="../index_login.jsp" target="_blank">预览首页</a>
				        </li>
                 <li> <a href="login.jsp" target="_top" >退出系统</a></li>
			</ul>
			<div class="timeanduser">
				<div class="clock" ></div>
				<div id="timecontainer"></div>
				<div>当前管理员：[<%=id.get("username")%>]<a href="Login.html" target="_top" id="logout" title="退出系统"></a></div>
			</div>
		</form>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="js/flipclock.js"></script>
		<script type="text/javascript">
			var clock = $('.clock').FlipClock({
				clockFace: 'TwelveHourClock'
			});
		</script>
		<script type="text/javascript">
		    t();

		    function t() {
		        var obj = document.getElementById('timecontainer');
		        var now = new Date();
		        var yy = now.getFullYear();
		        var mm = now.getMonth() + 1;
		        var dd = now.getDate();
		        var hhh = now.getHours();
		        var mmm = now.getMinutes();
		        var sss = now.getSeconds();
		        if (mm < 10) mm = "0" + mm;
		        if (dd < 10) dd = "0" + dd;
		        if (hhh < 10) hhh = "0" + hhh;
		        if (mmm < 10) mmm = "0" + mmm;
		        if (sss < 10) sss = "0" + sss;
		        var week;
		        if (now.getDay() == 0) week = "星期日";
		        if (now.getDay() == 1) week = "星期一";
		        if (now.getDay() == 2) week = "星期二";
		        if (now.getDay() == 3) week = "星期三";
		        if (now.getDay() == 4) week = "星期四";
		        if (now.getDay() == 5) week = "星期五";
		        if (now.getDay() == 6) week = "星期六";
		        var time = yy + "年" + mm + "月" + dd + "日 " +week;
		        obj.innerHTML = time;
		        setTimeout('t()', 1000);
		    }
		</script>
	</body>

</html>