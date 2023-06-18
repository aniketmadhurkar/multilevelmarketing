<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="header.jsp"/>
<h1 class="h3 mb-4 text-gray-800">Services</h1>
<div class="card">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Services</h6>
        <div class="btn-group float-right">
            <a href="add-service.jsp" class="btn btn-primary btn-sm">Add Service</a>
        </div>
    </div>
    <div class="card-body">

 
<div class="table-responsive">
<table class="table ">
    <thead>
        <th>Sr.No.</th>
        <th>Title</th>
        <th>Url</th>
    </thead>
    <tbody>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String q;
        String sql = "select * from services;";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            int service_id = rs.getInt("service_id");
            String service_title = rs.getString("service_title");
            String service_url = rs.getString("service_url");

            out.println("<tr>" + "<td>" + service_id + "</td>" + "<td>" + service_title + "</td>" + "<td>" + service_url + "</td><td><a id='btnEdit' class='btn btn-primary btn-sm' value='Edit' href='edit-service.jsp?id="+service_id+"'><i class='fa fa-edit'></i></a>&nbsp;&nbsp;&nbsp;<a type='button' class='btn btn-danger btn-sm' href='delete-service.jsp?id="+service_id+"' id='btnDelete' value='Delete'><i class='fa fa-trash'></i></a></td></tr>");

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