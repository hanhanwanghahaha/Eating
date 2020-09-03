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
		<p class="path">外卖后台/订单中心/订单列表</p>

		<table border="0" cellspacing="0" cellpadding="0" class="tb tblis">
	       <tr>
	       	   <td style="width:50px;">ID</td><td style="width:180px;">订单号</td><td style="width:100px;">取餐者</td><td style="width:130px;">电话</td><td>地址</td><td style="width:80px;">门牌号</td><td style="width:100px;">总金额</td><td style="width:200px;">时间</td><td style="width:150px;">操作</td>   
	       </tr>
			<%for (Map<String, Object> m : lists) { %>
	        <tr>
	       		<td><%=m.get("id")%></td>
	       		<td><%=m.get("orderid")%></td>
	       		<td><%=m.get("sname")%></td>
	       		<td><%=m.get("stel")%></td>
	       		<td>重庆工商大学融智学院<%=m.get("saddress")%>栋</td>
	       		<td><%=m.get("saddress2")%></td>
	       		<td><%=m.get("sumprice")%></td>
	       		<td><%=m.get("ctime")%></td>
	       		<td><a href="OrderView?orderid=<%=m.get("orderid")%>">详情</a> <a href="OrderDelete?id=<%=m.get("id")%>">删除</a></td>
	       </tr>
	    	<% } %>
			</table>
			<div style="text-align: center;margin-top: 30px;"><%=pagestr%> </div>
	</body>
</html>
