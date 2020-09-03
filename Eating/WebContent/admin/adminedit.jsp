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
		<form action="AdminEdit" method="post">
			<input type="hidden" name="id" value="<%=objbyid.get("id") %>"/>
			<a href="AdminListWithOutPager">返回列表</a>
			<table border="0" cellspacing="0" cellpadding="0" class="tb">
				<tr><td class="lable">管理员登录名</td><td><input type="text" name="username" value="<%=objbyid.get("username")%>"/></td></tr>
				<tr><td class="lable">管理员登录密码</td><td><input type="text" name="mima" value="<%=objbyid.get("mima")%>"/></td></tr>
				<tr><td class="lable">姓名</td><td><input type="text" name="truename" value="<%=objbyid.get("truename")%>"/></td></tr>
				<tr><td class="lable">&nbsp;</td><td><input type="submit" name="btnsave" value="保存" id="btnsave"/></td></tr>
			</table>
		</form>
	</body>
</html>
