<%@ page import="java.sql.*" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="net.sf.json.JSONObject" %>

<% 
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
        String email=request.getParameter("email"); 
        String pwd=request.getParameter("password"); 

         try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");
    
            Statement stmt = connection.createStatement();
            String sql ="select * from users where email='" + email + "' and password='" + pwd + "'";
            ResultSet rs = stmt.executeQuery(sql);

         
            
            String user_id ="";
            String user_name ="";
            if (rs.next()) {
                email = rs.getString("email");
                user_id = rs.getString("id");
                user_name = rs.getString("user_name");

                session.setAttribute("user_id", user_id); 
                session.setAttribute("id", session.getId());
                session.setAttribute("user_name", user_name); 
                session.setAttribute("email", email);        
                session.setAttribute("login_type", "user");
                
                String clientOrigin = request.getHeader("origin");
                response.setHeader("Access-Control-Allow-Origin", clientOrigin);
                response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
                response.setHeader("Access-Control-Allow-Headers", "Content-Type");
                response.setContentType("application/json");
                response.getWriter().write("{\"logged_in\":\"" + "1" + "\",\"user_id\":\"" + user_id + "\",\"user_name\":\"" + user_name + "\"}");
            }
            else { 
                user_id ="";
                user_name = "";
                session.setAttribute("user_id", user_id); 
                session.setAttribute("user_name", user_name); 
                session.setAttribute("email", ""); 
                session.setAttribute("login_type", "user");
                
                String clientOrigin = request.getHeader("origin");
                response.setHeader("Access-Control-Allow-Origin",  "true");
                response.setHeader("Access-Control-Allow-Origin", clientOrigin);
                response.setHeader("Access-Control-Allow-Methods", "POST");
                response.setHeader("Access-Control-Allow-Headers", "Content-Type");
                response.setHeader("Access-Control-Max-Age", "86400");
                response.setContentType("application/json");
                response.getWriter().write("{\"logged_in\":\"" + "0" + "\",\"user_id\":\"" + user_id + "\",\"user_name\":\"" + user_name + "\"}");
            } 
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
%>