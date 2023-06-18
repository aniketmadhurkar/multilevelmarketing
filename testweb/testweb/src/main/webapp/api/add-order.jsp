<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="net.sf.json.JSONObject" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<% 
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
	Date today = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String formattedDate = dateFormat.format(today);
    // Get the form data from the request
    String userId = request.getParameter("user_id");
    String orderDate =formattedDate;// request.getParameter("order_date");
    String totalAmount = request.getParameter("total_amount");
    String[] productIds = request.getParameterValues("product_id");
    String[] quantities = request.getParameterValues("quantity");
    
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");
        // Insert into the orders table
        String insertOrderQuery = "INSERT INTO orders (user_id, order_date, total_amount) VALUES (?, ?, ?)";
        PreparedStatement insertOrderStmt = connection.prepareStatement(insertOrderQuery, Statement.RETURN_GENERATED_KEYS);
        insertOrderStmt.setString(1, userId);
        insertOrderStmt.setString(2, orderDate);
        insertOrderStmt.setString(3, totalAmount);
        insertOrderStmt.executeUpdate();
        
        // Get the generated order_id
        ResultSet generatedKeys = insertOrderStmt.getGeneratedKeys();
        int orderId = -1;
        if (generatedKeys.next()) {
            orderId = generatedKeys.getInt(1);
        }
        
        // Insert into the order_items table
        String insertOrderItemQuery = "INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)";
        PreparedStatement insertOrderItemStmt = connection.prepareStatement(insertOrderItemQuery);
        
        for (int i = 0; i < productIds.length; i++) {
            insertOrderItemStmt.setInt(1, orderId);
            insertOrderItemStmt.setString(2, productIds[i]);
            insertOrderItemStmt.setString(3, quantities[i]);
            insertOrderItemStmt.executeUpdate();
        }
        
        
        // Close the database connection
        connection.close();
     
        String clientOrigin = request.getHeader("origin");
        response.setHeader("Access-Control-Allow-Origin",  "true");
        response.setHeader("Access-Control-Allow-Origin", clientOrigin);
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");
        response.setContentType("application/json");
        response.getWriter().write("{\"added\":\"" + "1" + "\",\"user_id\":\"" +userId + "\"}");
    } catch (Exception e) {
        // Handle any errors and display an error message
        out.println("An error occurred: " + e.getMessage());
        e.printStackTrace();
        
        // Rollback the transaction
        //connection.rollback();
        
        // Close the database connection
        connection.close();
        String clientOrigin = request.getHeader("origin");
        response.setHeader("Access-Control-Allow-Origin",  "true");
        response.setHeader("Access-Control-Allow-Origin", clientOrigin);
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");
        response.setContentType("application/json");
        response.getWriter().write("{\"added\":\"" + "0" + "\",\"user_id\":\"" +userId + "\"}");
    }
%>
