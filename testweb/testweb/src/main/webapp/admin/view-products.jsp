<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="header.jsp"/>
<h1 class="h3 mb-4 text-gray-800">Products</h1>
<div class="card">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Products</h6>
        <div class="btn-group float-right">
            <a href="add-product.jsp" class="btn btn-primary btn-sm">Add Product</a>
        </div>
    </div>
    <div class="card-body">

 
<div class="table-responsive">
<table class="table ">
    <thead>
        <th>Sr.No.</th>
        <th>Title</th>
        <th>Price</th>
        <th>Description</th>
        <th>Action</th>
    </thead>
    <tbody>
<%

    try {
    	  Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String q;
        String sql = "select * from products;";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            int product_id = rs.getInt("product_id");
            String product_title = rs.getString("product_title");
            float product_price = rs.getFloat("product_price");
            String product_description = rs.getString("product_description");

            out.println("<tr>" + "<td>" + product_id + "</td>" + "<td>" + product_title + "</td>" + "<td>" + product_price + "</td>"
                    + "<td>" + product_description +  "</td><td><a id='btnEdit' class='btn btn-primary btn-sm' value='Edit' href='edit-product.jsp?id="+product_id+"'><i class='fa fa-edit'></i></a></td></tr>");

        }
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
</tbody>
</table>
</div>
</div>
</div>
<jsp:include page="footer.jsp"/>