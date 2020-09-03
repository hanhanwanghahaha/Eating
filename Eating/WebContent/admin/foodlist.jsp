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
		<link rel="stylesheet" href="admin/css/comm.css" />
	</head>
	<body>
		<p class="path">外卖后台/菜品中心/菜品列表</p>

		<table border="0" cellspacing="0" cellpadding="0" class="tb tblis">
	       <tr>
	       	 <td style="width:50px;">ID</td><td style="width:150px;">菜系</td><td style="width:160px;">菜品图片</td><td style="width:160px;">菜品名称</td><td style="width:100px;">价格</td><td>特色</td><td style="width:100px;">操作</td>   
	       </tr>
	      	<%for (Map<String, Object> m : lists) { %>
	        <tr>
	       		<td><%=m.get("id")%></td>
	       		<td><%=m.get("kind")%></td>
	       		<td><img src="upload/<%=m.get("imgurl")%>"/ style="width:120px;height:60px;"></td>
	       		<td><%=m.get("cainame")%></td>
	       		<td><%=m.get("price")%></td>
	       		<td><%=m.get("brief")%></td>
	       		<td><a href="FoodEdit?id=<%=m.get("id")%>">修改</a> <a href="FoodDelete?id=<%=m.get("id")%>">删除</a></td>
	       </tr>
	    	<% } %>
    	</table>
    	<div style="text-align: center;margin-top: 30px;"><%=pagestr%> </div>
	</body>
</html>
