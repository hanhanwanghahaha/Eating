<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/comm.css" />
	</head>
	<body>
		<p class="path">外卖后台/管理员中心/新增管理员</p>
		<form action="../AdminAdd" method="post">
			<table border="0" cellspacing="0" cellpadding="0" class="tb">
				<tr><td class="lable">管理员登录名</td><td><input type="text" name="username"/></td></tr>
				<tr><td class="lable">管理员登录密码</td><td><input type="text" name="mima"/></td></tr>
				<tr><td class="lable">姓名</td><td><input type="text" name="truename"/></td></tr>
				<tr><td class="lable">&nbsp;</td><td><input type="submit" name="btnsave" value="保存" id="btnsave"/></td></tr>
			</table>
		</form>
	</body>
</html>
