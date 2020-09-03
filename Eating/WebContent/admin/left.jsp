<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>

		</title>
		<link rel="stylesheet" type="text/css" href="css/comm.css" />
		<style type="text/css">
			html {
				width: 100%;
				height: 100%;
			}
			
			body {
				width: calc(100% - 1px);
				height: 100%;
				border-right: solid 1px #eee;
				font-size: 12px;
			}
			
			.leftitem {
				width: 100%;
				list-style: none;
				padding-top: 2px;
			}
			
			.leftitem li {
				height: 35px;
				line-height: 35px;
				border-bottom: solid 1px #eee;
			}
			
			.leftitem li a {
				display: block;
				height: 35px;
				line-height: 35px;
				text-decoration: none;
				text-align: left;
				background-image: url(admin/admin_img/arrow-right.png);
				background-repeat: no-repeat;
				background-size: 15px 15px;
				background-position: 10px 10px;
				padding-left: 30px;
			}
			
			.leftitem li a:hover {
				background-color: #79C701;
				color: white;
			}
		</style>
	</head>

	<body>

		<form name="form1" method="post" action="left.aspx" id="form1">
			<ul class="leftitem" id="leftitem">
                
                        <li>
					        <a href="login.jsp"  target="_top">退出系统</a>
				        </li>
                    
				
			</ul>
		</form>
		<script src="../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			//此函数用来接收参数
		    function getQueryString(name) {
		        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		        var r = window.location.search.substr(1).match(reg);
		        if (r != null) {
		            return unescape(r[2]);
		        }
		    }
		    
		    var id=getQueryString("id");
		    var navstr="<li><a href=\"login.jsp\"  target=\"_top\">退出系统</a></li>";
		    switch(id)
		    {
		    	case "1":navstr="<li><a href=\"../AdminList\"  target=\"main\">管理员信息</a></li><li><a href=\"adminadd.jsp\"  target=\"main\">新增管理员</a></li><li><a href=\"login.jsp\"  target=\"_top\">退出系统</a></li>";break;
		    	case "2":navstr="<li><a href=\"../UserList\"  target=\"main\">用户信息</a></li><li><a href=\"login.jsp\"  target=\"main\">退出系统</a></li>";break;
		    	case "3":navstr="<li><a href=\"foodadd.jsp\"  target=\"main\">发布菜品</a></li><li><a href=\"../FoodList\"  target=\"main\">菜品列表</a></li><li><a href=\"login.jsp\"  target=\"main\">退出系统</a></li>";break;	
		    	case "4":navstr="<li><a href=\"../OrderList\"  target=\"main\">订单列表</a></li><li><a href=\"login.jsp\"  target=\"main\">退出系统</a></li>";break;	
		    }
		    $("#leftitem").html(navstr);
		    //var hrefurl=$("#leftitem li a:first").prop("href");
		    window.parent.frames["main"].location.href = "blank.jsp";

		</script>
	</body>
</html>