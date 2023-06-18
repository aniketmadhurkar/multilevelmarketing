<%@ page import="java.sql.*" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="net.sf.json.JSONObject" %>

<% 
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
        String email=request.getParameter("email"); 

         try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");
    
            Statement stmt = connection.createStatement();
            String sql ="select * from users where email='" + email + "' limit 1";
            ResultSet rs = stmt.executeQuery(sql);
            
            String user_id ="";
            String user_name ="";
            if (rs.next()) {
                session.setAttribute("user_id", user_id); 
                session.setAttribute("user_name", user_name); 
                session.setAttribute("email", email);        
                               	
                String clientOrigin = request.getHeader("origin");
                response.setHeader("Access-Control-Allow-Origin", clientOrigin);
                response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
                response.setHeader("Access-Control-Allow-Headers", "Content-Type");
                response.setContentType("application/json");
                response.getWriter().write("{\"exists\":\"" + "true" +  "\"}");
            }
            else { 
                String clientOrigin = request.getHeader("origin");
                response.setHeader("Access-Control-Allow-Origin",  "true");
                response.setHeader("Access-Control-Allow-Origin", clientOrigin);
                response.setHeader("Access-Control-Allow-Methods", "POST");
                response.setHeader("Access-Control-Allow-Headers", "Content-Type");
                response.setHeader("Access-Control-Max-Age", "86400");
                response.setContentType("application/json");
                response.getWriter().write("{\"exists\":\"" + "false" +  "\"}");
            } 
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
%>