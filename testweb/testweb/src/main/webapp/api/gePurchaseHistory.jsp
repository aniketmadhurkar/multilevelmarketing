<%@ page import="java.sql.*" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="net.sf.json.JSONObject" %>

<%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    String user_id=request.getParameter("id"); 
    if(user_id ==null){
    	user_id="0";
    }
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");
        statement = connection.createStatement();

   		String sql = "SELECT * FROM orders WHERE user_id=" + user_id + " ORDER BY id DESC";
        resultSet = statement.executeQuery(sql);
       
        JSONArray dataArray = new JSONArray();

        while (resultSet.next()) {    	           
            JSONObject dataObject = new JSONObject();
            dataObject.put("id", 1);
            dataObject.put("date", resultSet.getString("order_date"));
            dataObject.put("amount", resultSet.getString("total_amount"));	            
            dataArray.add(dataObject);
        }      
        
        response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type");

        response.setContentType("application/json");
        response.getWriter().write(dataArray.toString());
        
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        response.sendError(500, "Internal Server Error");
    } finally {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
