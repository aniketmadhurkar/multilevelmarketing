<%@ page import="java.sql.*" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="net.sf.json.JSONObject" %>
<% 
        session.setMaxInactiveInterval(30 * 60); // Set session timeout to 30 minutes
        
        String userid = request.getParameter("userid");
        String password = request.getParameter("password");
    
        // Establish database connection
        Connection connection = null;
        Statement stmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");
            stmt = connection.createStatement();
    
            ResultSet queryResult = stmt.executeQuery("SELECT * FROM admin WHERE username='" + userid + "' AND password='" + password + "'");
            if (queryResult.next()) {
            	session.setAttribute("admin_id", userid);
                session.setAttribute("user_id", userid);
                session.setAttribute("id", session.getId());
                session.setAttribute("login_type", "admin");
                session.setAttribute("user_name", "admin");
                
                response.sendRedirect("home.jsp");
            } else {
            	out.println("<script>alert('Email id or password is wrong.');window.location.assign('login.jsp');</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (connection != null) {
            	connection.close();
            }
        }
    %>