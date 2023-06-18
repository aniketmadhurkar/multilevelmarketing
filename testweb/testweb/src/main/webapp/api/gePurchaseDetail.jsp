<%@ page import="java.sql.*" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="net.sf.json.JSONObject" %>

<%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    String order_id=request.getParameter("id"); 
    if(order_id ==null){
    	order_id="0";
    }
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");
        statement = connection.createStatement();

   		String sql = "SELECT * FROM `order_items` inner join products on order_items.product_id=products.product_id WHERE 1 and order_items.order_id=" + order_id + " ";
        resultSet = statement.executeQuery(sql);
       
        JSONArray dataArray = new JSONArray();

        while (resultSet.next()) { 
            String product_id = resultSet.getString("product_id");
            String product_title = resultSet.getString("product_title");
            String product_price = resultSet.getString("product_price");
            String product_description = resultSet.getString("product_description");
            String product_image = resultSet.getString("product_image");
            
            JSONObject dataObject = new JSONObject();
            dataObject.put("id", product_id);
            dataObject.put("title", product_title);
            dataObject.put("price", product_price);
            dataObject.put("start_price", product_price);
            dataObject.put("description", product_description);
            dataObject.put("image","http://localhost:8082/testweb/images/"+ product_image);       
            dataObject.put("quantity", resultSet.getString("quantity"));

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
