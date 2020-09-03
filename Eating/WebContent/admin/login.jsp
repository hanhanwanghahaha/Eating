<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String msg =(String)request.getAttribute("msg");
	if(msg==null)
	{
		msg="";
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>"该吃饭了"校园外卖后台系统V1.0登录</title>
		<link rel="icon" href="/Eating/admin/admin_img/admin_logo.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="/Eating/css/style02.css" />
		<style type="text/css">
			body{
				background-image: url(/Eating/img/login_back.jpg);
				background-repeat: repeat-x;
			}
			.main{
				border:0.5px solid #FFFFFF;
				border-radius:30px;
				box-shadow: #59607B 10px 10px 30px 10px ;
				height: 340px;
				width: 660px;
				position: absolute;
				top:calc(50% - 170px);
				left: calc(50% - 330px);
				opacity: 1;
				background-image: url(/Eating/img/login.jpg);
				background-repeat: no-repeat;
				background-size: 100% 340px;
			}
			input{
				outline: none;
			}
			.main h2{
				color: white;
				text-align: center;
				margin-top: 40px;
				margin-bottom: 10px;
			}
			.loginbox{
				width: 350px;
				height: 160px;
				color: #FFFFFF;
				margin: 0 auto;
			}
			.loginbox p{
				height: 30px;
				padding: 5px 0;
				margin-bottom: 8px;
			}
			.text{
				width: 340px;
				height: 40px;
				padding-left: 10px;
			}
			.btnlogin{
				margin:  0 auto;
				width: 352px;
				height: 45px;
				border: 0;
				font-size: 18px;
				margin-top: -10px;
				color:#FFFFFF;
				cursor: pointer;
				border: none;
			}
			#msg{
				height:20px;
				margin:0;
				visibility:visible;
			}
		</style>
	</head>
	<body>
	    <form action="/Eating/Login" method="post" >
			<div class="main">
				<h2>
					"该吃饭了"校园外卖后台系统V1.0
				</h2>
				<div class="loginbox">
					
					<p><input type="text" name="username" id="username" class="text" placeholder="管理员账号"/></p>
					<p><input type="password" name="mima" id="mima" class="text"  placeholder="密码（6-16位）"/></p>
					<p id="msg"><%=msg%></p>
					<p><input type="submit" value="登录" class="btnlogin" id="dl"/></p>
				</div>
			</div>
		</form>
	<script src="/Eating/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
	<script>
	      $("#dl").click(function (e) {
	          var username = $("#username");
	          if (!username.val().length > 0)
	          {
	              $("#msg").text("请输入用户名！");
	              username.focus();
	              e.preventDefault();
	              return false;
	          }
	
	          var password = $("#mima");
	          if (!password.val().length > 0) {
	              $("#msg").text("请输入密码！");
	              password.focus();
	              e.preventDefault();
	              return false;
	          }
	      });
	 </script>
	</body>
</html>
