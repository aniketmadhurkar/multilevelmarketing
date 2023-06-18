<%
    // Check if admin_id is not set in session, redirect to login page
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
    }

    // Check if user_type is set in session and it's not equal to 'admin2', redirect to login page
    if (session.getAttribute("login_type") != null && !session.getAttribute("login_type").equals("admin")) {
        response.sendRedirect("login.jsp");
    }
%>
