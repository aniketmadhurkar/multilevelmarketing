<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<table>
    <thead>
        <th>Title</th>
        <th>Price</th>
        <th>Description</th>
    </thead>
    <tbody>
<%

    try {
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String q;
        out.println("test2");
        String sql = "select * from products;";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            int product_id = rs.getInt("product_id");
            String product_title = rs.getString("product_title");
            float product_price = rs.getFloat("product_price");
            String product_description = rs.getString("product_description");

            out.println("<tr>" + "<td>" + product_id + "</td>" + "<td>" + product_title + "</td>" + "<td>" + product_price + "</td>"
                    + "<td>" + product_description +  "</td></tr>");

        }
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
</tbody>
</table>