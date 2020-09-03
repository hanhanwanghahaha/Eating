<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<meta charset="utf-8" />
		<title>欢迎注册！</title>
		<link rel="icon" href="img/logo2.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/slide.css"/>
		<link rel="stylesheet" type="text/css" href="css/style02.css"/>
		<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}
		
			.box1{
				height:752px;
			    float: left;
				}
				
			.box1 img{
				display: block;
				height: 752px;
			}
			
			.box2{
				width: 500px;
				height: 600px;
				position: fixed;
				top:calc(50% - 300px);
				right:calc(35% - 250px);;
			}
			
			.hy{
				margin-top: 40px;
				font-weight: 500;
				font-size: 38px;
				line-height: 40px;
			}
				
			.word{
				margin-top: 30px;
				font-weight: 400;
				font-size: 26px;
				line-height: 30px;
			}
			
			.u1{
				line-height: 40px;
				width: 400px;
				height: 40px;
				color: #333;
				padding-left: 20px;
				margin-top: 20px;
				font-size: 16px;
			}
			
			.submit{
				line-height: 50px;
				height: 50px;
				width:420px;
				color: #333;
				margin-top: 30px;
				background-color: #46a3ff;
				outline: none;
			}
			
			.tiaokuan{
				line-height: 50px;
				margin-top: 30px;
				font-size: 15px;
			}
			
			.tiaokuan a{
				text-decoration: none;
			}
			
			.qita{
				width: 200px;
				height:55px;
			    float: right;
			}
			
			.fankui{
				
				right: 30px;
				top: 20px;
			}
			
			.fankui a{ 
			    text-decoration: none;
			    color: #d0d0d0;    
			}
				
			.fankui a:hover{
				color:black;
			}
			
			.wenzi{
				right: 120px;
				top: 20px;
			}
				
			.wenzi option:hover{
				color:black;
			}
			input{
				box-shadow: none;
				outline: none;
			}
			#btnsave{
				background-color: #3091f2;
				color:#FFFFFF;
				cursor: pointer;
				border-radius: 2px;
				border: none;
				box-shadow: none;
				border: none ;
				text-shadow: none ;
			}
			#btnsave:hover{
				background-color: skyblue;
			}
		</style>
	</head>
	<body>
		<div class="box1">
			<div class="pptbox" id="ppt01">
			<ul class="innerwrapper">
				<li><a href="#"><img src="img/001.png"/></a></li>
				<li><a href="#"><img src="img/002.png"/></a></li>
				<li><a href="#"><img src="img/003.png"/></a></li>
				<li><a href="#"><img src="img/005.jpg"/></a></li>
			</ul>
			<ul class="controls">
				<li class="current">1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
				</ul>			
			<span class="btnleft"></span>
			<span class="btnright"></span>			
		    </div>
		</div>
		<div class="box2">
			<div class="zhuce" style="text-align: center;">
				<p class="hy" style="text-align: center;">欢迎注册"该吃饭了"</p>
				<p class="word" style="text-align: center;">每一天，乐在吃饭。</p>
				<div>
					<form action="/Eating/ZhuCe" method="post" name="form1" onsubmit="return checkpost()">
					   <input type="hidden" name="hd1" id="hd1" value="100" />
					   <div><input type="text" name="loginname" id="loginname" placeholder="请输入用户名/手机号/学号" class="u1"/></div>
					   <div><p id="msg" style="color: red;text-align: left;padding-left: 50px;font-size: 14px;"><%=msg%></p></div>
					   <div><input type="password" name="password" id="password" placeholder="请输入密码(数字/字母)" maxlength="12" class="u1" onkeyup="compare();"/></div>			    
					   <div><input type="password" name="password2" id="password2" placeholder="请确认密码" maxlength="12" class="u1" onkeyup="compare();"/></div>
					   <div id="ts" style="color: red;text-align: left;padding-left: 50px;font-size: 14px;"></div>
					   <div><input type="text" name="tel" id="tel" placeholder="请输入电话" class="u1"/></div>
					   <div><input type="submit" name="btnsave" id="dl" value="立即注册" class="submit" style="cursor: pointer;color: #FFFFFF;font-size: 24px;"/></div>
				    </form>
				    <script>
	                function compare()
	                {
	                	var a=document.getElementById('password').value;
	                    var b=document.getElementById('password2').value;
	                    if(a!=b&&a!=null&&b!=null)
	                        {document.getElementById('ts').innerHTML="两次密码不一致!";
	                    }
	                        else {document.getElementById('ts').innerHTML=null;
	                    }
	                }
	                </script>
	                <script language="JavaScript">
	                function checkpost()
	                {
	                    if(form1.loginname.value=="")
	                    {
	                        alert("请输入用户名");
	                        form1.name.focus();
	                        return false;
	                    }
	                    if(form1.password.value=="")
	                    {
	                        alert("请输入密码");
	                        form1.password.focus();
	                        return false;
	                    }
	                    if(form1.password2.value=="")
	                    {
	                        alert("请再次输入密码");
	                        form1.password2.focus();
	                        return false;
	                    }
	                    if(document.form1.password.value != document.form1.password2.value)
	                    {
	                        alert("您两次输入的密码不一样！请重新输入.");
	                        document.form1.password2.focus();
	                        return false;
	                    }
	                    if(form1.password2.value=="")
	                    {
	                        alert("请再次输入密码");
	                        form1.password2.focus();
	                        return false;
	                    }
	                        //alert("注册成功");
	                }
	                </script>
				    <p class="tiaokuan"><input type="checkbox" name="hobby" value="" checked="checked" onclick="confirmBox()" id="cbId"/>我已经阅读并同意<a href="https://qzone.qq.com/web/tk.html">相关条款</a>和<a href="https://privacy.qq.com/">隐私政策</a>。
			        <script type="text/javascript">
	                function confirmBox(){
	                    var confirmBox = document.getElementById("cbId");
	                    if(confirmBox.checked){
	                        form.submit();
	                    }else{
	                        alert("请同意协议");
	                        document.getElementById("cbId").disabled = false;
	                    return false;
	                    }
	                }
	                </script>
				</div>
			</div>
		</div>
		<div class="qita">
			<div class="fankui" style="float: left;"><a href="https://support.qq.com/products/14802">意见反馈</a></div>
			<div class="wenzi" style="float: left;margin-left: 40px;">
				<select name="select" language=javascript onchange="javascript:window.open(this.options[this.selectedIndex].value)" style="border-style: none;text-decoration: none;color: #d0d0d0;outline: none;font-size: 16px;">
                       <option selected="selected" >中文简体</option>
                       <option value= "zhuce2.html" outline: none;>English</option>
                       <option value= "zhuce3.html" outline: none;>中文繁體</option>
		    </div>
	    </div>
	    <script src="/Eating/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
	    <script src="/Eating/js/tyslide.js" type="text/javascript" charset="utf-8"></script>
	    <script type="text/javascript">			
		$("#ppt01").tyslide({
			boxh:752,//盒子的高度
			w:450,//盒子的宽度
			h:752,//图片的高度
			isShow:true,//是否显示控制器
			isShowBtn:false,//是否显示左右按钮
			controltop:5,//控制按钮上下偏移的位置,要将按钮向下移动   首先保证boxh 高度>图片 h
			controlsW:60,//控制按钮宽度
			controlsH:10,//控制按钮高度
			radius:10,//控制按钮圆角度数
			controlsColor:"#eee",//普通控制按钮的颜色
			controlsCurrentColor:"#3091f2"//当前控制按钮的颜色
		});
	    </script>
	</body>
</html>
