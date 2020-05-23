<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="java.sql.*" %>
<%@ page import="jwgl.service.Authentic"
		import="jwgl.bean.Student"
%>
<jsp:useBean id="login" class="jwgl.bean.Student" scope="session" ></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录验证</title>
</head>
<body>
	<%
		String messsage="", stuID="", password="";
		if (!(session.isNew())){
			stuID=request.getParameter("stuID");
			if (stuID == null){
				stuID="";
			}
			password=request.getParameter("password");
			if (password == null){
				password="";
			}
		}
		if (Authentic.login(login)){
			session.setAttribute("stuID", stuID);
			session.setAttribute("password", password);			
			response.sendRedirect("login.jsp");
		}
		else
		{
		%>
		<p>密码错误，请重新登录！</p>
		<p>5秒后返回登录页面</p>
		<%
			session.invalidate();
			response.setHeader("refresh", "5;url=login.jsp");//跳转到登录页面

		}
	%>
</body>
</html>
