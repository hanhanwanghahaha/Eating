<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>

<%
List<Map<String, Object>> lists = (List<Map<String, Object>>)request.getAttribute("lists");
String pagestr= (String)request.getAttribute("pagestr");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="admin/css/comm.css"/>
	</head>
	<body>
			<p class="path">外卖平台/用户中心/用户信息</p>
			<table border="0" cellspacing="0" cellpadding="0" class="tb tblis">
				<tr>
	       	 		<td style="width:50px;">ID</td><td style="width:150px;">登录名</td><td style="width:150px;">密码</td><td style="width:150px;">电话</td><td style="width:150px;">操作</td>   
       			</tr>
       			<%for (Map<String, Object> m : lists) { %>
	        <tr>
	       		<td><%=m.get("id")%></td>
	       		<td><%=m.get("loginname")%></td>
	       		<td><%=m.get("password")%></td>
	       		<td><%=m.get("tel")%></td>
	       		<td><a href="UserEdit?id=<%=m.get("id")%>">修改</a> <a href="UserDelete?id=<%=m.get("id")%>">删除</a></td>
	       </tr>
	    	<% } %>
			</table>
			<div style="text-align: center;margin-top: 30px;"><%=pagestr%> </div>
			
	</body>
</html>
