<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="header.jsp"/>
<h1 class="h3 mb-4 text-gray-800">Users</h1>
<div class="card">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Users</h6>

    </div>
    <div class="card-body">

 
<div class="table-responsive">
<table class="table ">
    <thead>
        <th>Sr.No.</th>
        <th>User Name</th>
        <th>Email</th>
        <th>Mobile</th>
        <th>Side</th>
        <th>View Commissions</th> 
    </thead>
    <tbody>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String sql = "select * from users;";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            int user_id = rs.getInt("id");
            String user_name = rs.getString("user_name");
            String email = rs.getString("email");
            String mobile = rs.getString("mobile");
            String side = rs.getString("side");
            out.println("<tr>" + "<td>" + user_id + "</td>" + "<td>" + user_name + "</td>" + "<td>" + email + "</td><td>" + mobile + "</td><td>" + side + "</td><td><a id='btnEdit' class='btn btn-primary btn-sm' value='Edit' href='user-commisions.jsp?id="+user_id+"'>View Commissions</a></td></tr>");

            

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