<%@ page import="java.sql.*" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="net.sf.json.JSONObject" %>
<%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    String videoId = "";
    try {
        // Establish a database connection
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        // Create a SQL statement
        statement = connection.createStatement();

        // Execute the query
        String sql = "SELECT * FROM services WHERE 1  " ;
        resultSet = statement.executeQuery(sql);

        
        JSONArray serviceArray = new JSONArray();
 
        	while (resultSet.next()) {
            // Retrieve post data from the result set
            String service_id = resultSet.getString("service_id");
            String service_title = resultSet.getString("service_title");
            String service_url = resultSet.getString("service_url");

            String pattern = "(?<=watch\\?v=|/videos/|embed\\/|youtu.be\\/|\\/v\\/|\\/e\\/|watch\\?v%3D|watch\\?feature=player_embedded&v=|%2Fvideos%2F|embed%\u200C\u200B2F|youtu.be%2F|%2Fv%2F)[^#\\&\\?\\n]*";

java.util.regex.Pattern compiledPattern = java.util.regex.Pattern.compile(pattern);
java.util.regex.Matcher matcher = compiledPattern.matcher(service_url);

// Find the video ID
if (matcher.find()) {
    videoId = matcher.group();
}

            JSONObject serviceObject = new JSONObject();
            serviceObject.put("id", service_id);
            serviceObject.put("title", service_title);
            serviceObject.put("url", service_url);
            serviceObject.put("video_id", videoId);

            serviceArray.add(serviceObject);
            }
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            
        response.setContentType("application/json");
        response.getWriter().write(serviceArray.toString());
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
