<%
    session.setAttribute("userid", null);
	session.setAttribute("id", null);
	session.setAttribute("login_type",null);
	session.setAttribute("user_name", null);
	session.invalidate();
    response.sendRedirect("login.jsp");
%>	