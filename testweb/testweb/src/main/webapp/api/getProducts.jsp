<%@ page import="java.sql.*" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="net.sf.json.JSONObject" %>

<%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        // Establish a database connection
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        // Create a SQL statement
        statement = connection.createStatement();

        // Execute the query
        String sql = "SELECT * FROM products WHERE 1  " ;
        resultSet = statement.executeQuery(sql);

        JSONArray productArray = new JSONArray();
        

        	while (resultSet.next()) {
            // Retrieve post data from the result set
            String product_id = resultSet.getString("product_id");
            String product_title = resultSet.getString("product_title");
            String product_price = resultSet.getString("product_price");
            String product_description = resultSet.getString("product_description");
            String product_image = resultSet.getString("product_image");
            
            JSONObject postObject = new JSONObject();
            postObject.put("id", product_id);
            postObject.put("title", product_title);
            postObject.put("price", product_price);
            postObject.put("start_price", product_price);
            postObject.put("description", product_description);
            postObject.put("image","http://localhost:8082/testweb/images/"+ product_image);
            
            // Add the post object to the JSON array
            productArray.add(postObject);
        	}
            
      
        
        // Generate the JSON response
        response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");

        response.setContentType("application/json");
        response.getWriter().write(productArray.toString());
        
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        // Handle and log any exceptions that occur
        response.sendError(500, "Internal Server Error");
    } finally {
        // Close the database resources
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
