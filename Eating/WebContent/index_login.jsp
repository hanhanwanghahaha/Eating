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
		<meta charset="UTF-8">
		<title>欢迎登录！</title>
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/scrolltopcontrol.js"></script>
		<link rel="icon" href="img/logo2.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/style02.css" />
		<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}
			
			.input{
				width: 424px;
				height: 545px;
				background-color: #FFFFFF;
				opacity: 1;
				position: fixed;
				top:calc(50% - 272.5px);
				right: 90px;
				box-shadow: #59607B 4px 4px 13px 2px ;
			}
			
			.img{
				height: 680px;
				margin-bottom: 5px;
			}
			
			.circle{
				text-align: center;
				margin-top: 10px;
			}
			.circle1{
				padding-left: 10px;
				width: 290px;
			}
			h1{
				color: #59607b;
				margin-top: 50px;
				margin-bottom: 20px;
				text-align: center;
			}
			
			input{
				width: 300px;
				height: 40px;
				outline: none;
				margin-bottom: 20px;
			}
			
			.span{
				color: #59607B;
				margin-bottom: 30px;
				text-align: center;
			}
			
			#dl{
				font-size: 16px;
				margin-top: 10px;
				background-color: #3091f2;
				color:#FFFFFF;
				cursor: pointer;
				border-radius: 2px;
				border: none;
			}
			#dl:hover{
				background-color: skyblue;
			}
			.cross-line{
				display: inline-block;
				height: 1px;
				vertical-align: top;
				background-color: #cbcbcb;
			}
			a{
				text-decoration: none;
			}
			.dlimg{
				margin-top: 20px;
				margin-left: 30px;
				margin-right: 30px;
			}
			#topcai{
				margin-top: 30px;
				margin-left: 10px;
				margin-right: 10px;
			}
			.cai{
				-webkit-transition: all ease-out .5s;
			    -o-transition: all ease-out .5s;
			    transition: all ease-out .5s;
			    -ms-transition: all ease-out .5s;
			}
			.cai:hover{
				box-shadow: #59607B 5px 5px 24px 5px ;
				-webkit-transform: scale(1.2);
			    -o-transform: scale(1.2);
			    transform: scale(1.2);
			    -ms-transform: scale(1.2);
			}
			span{
				margin-top: 10px;
				margin-left: 22px;
				margin-right: 22px;
				color:#cbcbcb ;
			}
			#img1{background-image: url(img/back1.jpg);background-size: 100% 680px;}
			#img2{background-image: url(img/back3.jpg);background-size: 100% 680px;}
			#img3{background-image: url(img/back2.jpg);background-size: 100% 680px;}
			#img4{background-image: url(img/back4.jpg);background-size: 100% 680px;}
			#img5{background-image: url(img/back5.jpg);background-size: 100% 680px;}
			#img6{background-image: url(img/back6.jpg);background-size: 100% 680px;}
			.name{
				color: #59607B;
				font-family: 华文行楷;
				font-size: 50px;
				margin-left: 18px;
				margin-right: 18px;
			}
			.mxl{
				color: #ED0D03;
				font-family: 华文行楷;
				font-size: 120px;
				line-height: 340px;
				margin-left: 18px;
				margin-right: 18px;
			}
			.type{
				padding-left: 30px;
				font-size: 50px;
				line-height: 50px;
				font-family: 华文行楷;
				color:#59607B;
				margin-top: 35px;
				
			}
			/*.type:hover{
				padding-left: 30px;
				font-size: 50px;
				line-height: 50px;
				font-family: 华文行楷;
				color:#3091F2;
				margin-top: 35px;
			}*/
			.sub{
				padding-left: 30px;
				text-indent: 2em;
				font-size: 22px;
				line-height: 26px;
				font-family: 华文行楷;
				color: #59607B;
				margin-top: 10px;
				letter-spacing: 2px;
				text-align: justify; 
				text-justify: inter-ideograph;
			}
			/*.sub:hover{
				padding-left: 30px;
				text-indent: 2em;
				font-size: 22px;
				line-height: 26px;
				font-family: 华文行楷;
				color: #3091F2;
				margin-top: 10px;
				letter-spacing: 2px;
				text-align: justify; 
				text-justify: inter-ideograph;
			}*/
			
			.back_to_top{
				text-align: center;
			    position: fixed;
			    bottom:40px;
			    right: 90px;
			    width: 50px;
			    height: 50px;
			    font-size: 18px;
			    border: 0px;
			    color: #A9A9A9;
			    background-color: #FFFFFF;
			    cursor: pointer;
			}
		</style>
	</head>
	<body>
		<div>
		
		<!--登录小页面-->
			<div class="input">
				<h1>账号登录</h1>
				<div class="span">推荐使用一卡通学号，更方便</div>
				
				<!--账号和密码-->
				<form action="Login_index" method="post">
					<div class="circle">
						<input type="text" name="loginname" id="loginname" placeholder="用户名/手机号/学号"/ class="circle1">
					</div>
					<div class="circle">
						<input type="password" name="password" id="password" placeholder="密码（6-16位）" class="circle1"/>
					</div>
				<!--注册账号-->
				<div style="text-align: right;padding-right: 60px;">
					<p style="float: left;color: #3091f2;padding-left: 60px;" id="msg"><%=msg%></p><a style="color: #3091f2;" href="zhuce.jsp">注册账号</a>
				</div>
				<!--登录按钮-->
				<div style="margin-left: 62px;display: block;">
					<input type="submit" id="dl"  value="登录" class="btnlogin"/>
				</div>
				</form>
				
				<!--第三方登录账号-->
				<div style="text-align: center;font-size: 12px;color: #cbcbcb;">
					<span class="cross-line" style="width: 90px;"></span>
					&nbsp;第三方账号登录&nbsp;
					<span class="cross-line" style="width: 90px;"></span>
				</div>
				<div style="text-align: center;margin-top: 2px;">
					<a  href="###"><img class="dlimg" src="img/login_wx.png"></a>
					<a  href="###"><img class="dlimg" src="img/login_qq.png"></a>
					<a  href="###"><img class="dlimg" src="img/login_wb.png"></a>
				</div>
				<div style="text-align: center;margin-top: 5px;">
					<span>微信账号</span>
					<span>QQ账号</span>
					<span>微博账号</span>
				</div>
			</div>
		<!--登录小页面结束-->	
		
		<!--图片开始-->	
		<!--第一张图片开始-->	
			<div class="img" id="img1">
				<div style="text-align: center;">
					<img src="img/back1-2.png" />
					<p style="font-family: 华文行楷;font-size: 24px;">
						------------&nbsp;&nbsp;
						<a style="color: #59607B;" target="_blank" href="https://baike.baidu.com/item/%E4%BC%A0%E7%BB%9F%E7%BE%8E%E9%A3%9F/14470686?fr=aladdin">
							中国传统饮食文化
						</a>
						&nbsp;&nbsp;------------
					</p>
				</div>
				<div style="height: 340px;width: 1500px;margin: 0 auto;">
					<div style="text-align: center;">
						<img class="cai" id="topcai" src="img/chuan.jpg" />
						<img class="cai" id="topcai" src="img/yue.jpg" />
						<img class="cai" id="topcai" src="img/su.jpg" />
						<img class="cai" id="topcai" src="img/zhe.jpg" />
						<img class="cai" id="topcai" src="img/hui.jpg" />
						<img class="cai" id="topcai" src="img/min.jpg" />
						<img class="cai" id="topcai" src="img/lu.jpg" />
						<img class="cai" id="topcai" src="img/xiang.jpg" />
					</div>
					<div style="text-align: center;margin-top: 20px;">
						<span><a href="###" class="name">川菜</a></span>
						<span><a href="###" class="name">粤菜</a></span>
						<span><a href="###" class="name">苏菜</a></span>
						<span><a href="###" class="name">浙菜</a></span>
						<span><a href="###" class="name">徽菜</a></span>
						<span><a href="###" class="name">闽菜</a></span>
						<span><a href="###" class="name">鲁菜</a></span>
						<span><a href="###" class="name">湘菜</a></span>
					</div>
					<div style="text-align: center;margin-top: 20px;">
						<p style="font-family: 华文行楷;font-size: 24px;color: #59607B;">
							>>>>>>>>>>&nbsp;&nbsp;饿了么？那就该吃饭了！&nbsp;&nbsp;<<<<<<<<<<<br/>
							>>>>>>>>>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;八大菜系任你挑！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<<<<<<<<<<
						</p>
					</div>
				</div>
			</div>
			<!--第一张图片结束-->	
			
			<!--第二张图片开始-->	
			<div class="img" id="img2">
				<div style="width:210px;font-family: 华文行楷;font-size: 210px;float: right;margin-top: 100px;margin-right: 110px;">
					<a style="color: #A9A9A9;" target="_blank" href="https://baike.baidu.com/item/%E5%B7%9D%E8%8F%9C/26409?fr=aladdin">
					川</a>	
				</div>
				<div style="width: 1000px;height: 680px;">
					<div style="width: 1000px;height:340px;float:left;">
						<p class="type">川菜</p>
						<p class="sub">川菜即四川菜肴，是中国特色传统的四大菜系之一、中国八大菜系之一、中华料理集大成者。</p>
						<p class="sub">川菜取材广泛，调味多变，菜式多样，口味清鲜醇浓，善用麻辣调味，有着别具一格的烹调方法和浓郁的地方风味，
							融汇了各方的特点，博采众家之长，善吸收，善创新，享誉中外。四川省会成都市被联合国教科文组织授予“世界美食之都”的荣誉称号。</p>
					</div>
					<div style="width:340px;height: 320px;float: left;margin-top: 20px;text-align: center;"><img class="cai" src="img/chuan5.jpg" /></div>
					<div style="height: 340px;float: left;text-align: center;">
						<span class="mxl">'麻'</span>
						<span class="mxl">'香'</span>
						<span class="mxl">'辣'</span>
					</div>
				</div>
			</div>
			<!--第二张图片结束-->	
			
			<div class="img" id="img3">
				<div style="width: 1000px;height: 680px;">
					<div style="width: 340px;height: 320px;float: left;text-align: center;padding-top: 20px;"><img class="cai" src="img/yue4.jpg" /></div>
					<div style="width: 660px;height: 340px;float: left;">
						<p class="type" style="color: #FFFFFF;">粤菜</p>
						<p class="sub" style="color: #FFFFFF;">粤菜即广东菜，是中国传统四大菜系、八大菜系之一，源自中原，经历了两千多年的发展历程后，到了晚清时期已渐成熟 。</p>
						<p class="sub" style="color: #FFFFFF;"><a style="color: #FFFFFF;" target="_blank" href="https://baike.baidu.com/item/%E5%B9%BF%E5%B7%9E%E8%8F%9C/1798962">
							广州菜</a>是粤菜的代表，
							民间有“食在广州”的美誉，顺德更被联合国教科文组织授予世界“美食之都”称号。</p>
					</div>
					
					<div style="width: 660px;height: 340px;float: left;">
						<p class="type" style="color: #FFFFFF;">苏菜</p>
						<p class="sub" style="color: #FFFFFF;">江苏菜，中国传统八大菜系之一，简称苏菜。</p>
						<p class="sub" style="color: #FFFFFF;">苏菜擅长炖、焖、蒸、炒，重视调汤，保持菜的原汁，风味清鲜，浓而不腻，淡而不薄，酥松脱骨而不失其形，滑嫩爽脆而不失其味。</p>
					</div>
					<div style="width: 340px;height: 320px;float: left;text-align: center;padding-top: 20px;"><img class="cai" src="img/su4.jpg" /></div>
				</div>
			</div>
			
			<div class="img" id="img4">
				<div style="width: 1000px;height: 680px;">
					<div style="width: 340px;height: 320px;float: left;text-align: center;padding-top: 20px;"><img class="cai" src="img/zhe4.jpg" /></div>
					<div style="width: 660px;height: 340px;float: left;">
						<p class="type">浙菜</p>
						<p class="sub">浙江菜，简称浙菜，是中国汉族八大菜系之一。</p>
						<p class="sub">浙江省位于我国东海之滨，北部水道成网，素有鱼米之乡之称。其地山清水秀，物产丰富佳肴美，故谚曰:"上有天堂，下有苏杭"。</p>
					</div>
					
					<div style="width: 660px;height: 340px;float: left;">
						<p class="type" style="color: #A9A9A9;">徽菜</p>
						<p class="sub" style="color: #A9A9A9;">徽菜，是中国八大菜系之一，起源于徽州府城歙县（古徽州）。</p>
						<p class="sub" style="color: #A9A9A9;">安徽省宣城市绩溪县被授予中国徽菜之乡称号，每年均举办国际徽菜饮食文化节。</p>
					</div>
					<div style="width: 340px;height: 320px;float: left;text-align: center;padding-top: 20px;"><img class="cai" src="img/hui4.jpg" /></div>
				</div>
			</div>
			
			<div class="img" id="img5">
				<div style="width: 1000px;height: 680px;">
					<div style="width: 340px;height: 320px;float: left;text-align: center;padding-top: 20px;"><img class="cai" src="img/min4.jpg" /></div>
					<div style="width: 660px;height: 340px;float: left;">
						<p class="type">闽菜</p>
						<p class="sub">闽菜是中国八大菜系之一，历经中原汉族文化和闽越族文化的混合而形成。</p>
						<p class="sub">闽菜以烹制山珍海味著称，在色香味形俱佳基础上，尤以“香”、“味”见长，其清鲜、和醇、荤香、不腻的风格特色和
							汤路广泛的特点，在烹坛园地中独具一席。</p>
					</div>
					
					<div style="width: 660px;height: 340px;float: left;">
						<p class="type">鲁菜</p>
						<p class="sub">鲁菜，是历史最悠久、技法最丰富、难度最高、最见功力的菜系，是八大菜系之首。</p>
						<p class="sub">风味特色：咸鲜为主、火候精湛、精于制汤、善烹海味、注重礼仪。</p>
					</div>
					<div style="width: 340px;height: 320px;float: left;text-align: center;padding-top: 20px;"><img class="cai" src="img/lu4.jpg" /></div>
				</div>
			</div>
			
			<div class="img" id="img6">
				<div style="width: 1000px;height: 680px;">
					<div style="width:340px;height: 320px;float: left;margin-top: 20px;text-align: center;"><img class="cai" src="img/xiang4.jpg" /></div>
					<div style="height: 340px;float: left;text-align: center;">
							<span class="mxl" style="color: gold;">'鲜'</span>
							<span class="mxl" style="color: gold;">'香'</span>
							<span class="mxl" style="color: gold;">'嫩'</span>
					</div>
					<div style="width: 1000px;height:300px;float:left;">
						<p class="type" style="color: #FFFFFF;">湘菜</p>
						<p class="sub" style="color: #FFFFFF;">湘菜，即湖南菜，在长沙地区又被称为本味菜，是中国历史悠久的八大菜系之一。</p>
						<p class="sub" style="color: #FFFFFF;">湘菜制作精细，用料上比较广泛，口味多变，品种繁多；色泽上油重色浓，讲求实惠；
							品味上注重香辣、香鲜、软嫩；制法上以煨、炖、腊、蒸、炒诸法见称。</p>
					</div>	
				</div>
			</div>
		<!--图片结束-->
		</div>
		<script src="/Eating/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script>
		      $("#dl").click(function (e) {
		          var username = $("#loginname");
		          if (!username.val().length > 0)
		          {
		              $("#msg").text("请输入用户名！");
		              username.focus();
		              e.preventDefault();
		              return false;
		          }
		
		          var password = $("#password");
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
