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
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="admin/css/comm.css"/>
	</head>
<body>
		<p class="path">外卖后台/管理员中心/新增管理员</p>
		<form action="UserEdit" method="post">
			<input type="hidden" name="id" value="<%=objbyid.get("id") %>"/>
			<a href="UserListWithOutPager">返回列表</a>
			<table border="0" cellspacing="0" cellpadding="0" class="tb">
				<tr><td class="lable">用户名</td><td><input type="text" name="loginname" value="<%=objbyid.get("loginname")%>"/></td></tr>
				<tr><td class="lable">电话号码</td><td><input type="text" name="tel" value="<%=objbyid.get("tel")%>"/></td></tr>
				<tr><td class="lable">密码</td><td><input type="text" name="password" value="<%=objbyid.get("password")%>"/></td></tr>
				<tr><td class="lable">&nbsp;</td><td><input type="submit" name="btnsave" value="保存" id="btnsave"/></td></tr>
			</table>
		</form>
	</body>
</html>
