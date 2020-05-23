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
		//设置统一编码，解决中文乱码
		request.setCharacterEncoding("utf-8");
		//获取login.jsp中的学号
		//String stuI=request.getParameter("stuID");	
		//获取login.jsp中的密码
		//String psw=request.getParameter("password");
		
		login.setStuID(request.getParameter("stuID"));
		login.setPassword(request.getParameter("password"));
		
%>
	
		<%=login.getStuID()%>
		<%=login.getPassword()%>

<%
		if (Authentic.login(login)){//
			session.setAttribute("stuID", login.getStuID());
			session.setAttribute("password", login.getPassword());			
			response.sendRedirect("Main-menu.jsp");
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
