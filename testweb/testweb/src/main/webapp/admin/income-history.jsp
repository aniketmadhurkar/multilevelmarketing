<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="header.jsp"/>
<h1 class="h3 mb-4 text-gray-800">Income History</h1>
<div class="card">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Income History</h6>

    </div>
    <div class="card-body">

 
<div class="table-responsive">
<table class="table ">
    <thead>
        <th>Sr.No.</th>
        <th>User Name</th>
        <th>Amount</th>
        <th>Date</th>
    </thead>
    <tbody>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String q;
        String sql = "select * from income_received order by id desc;";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            String user_id = rs.getString("user_id");
            String amount = rs.getString("amount");
            String date = rs.getString("date");
            out.println("<tr>" + "<td>" + user_id + "</td>" + "<td>" + amount + "</td>" + "<td>" + date + "</td></tr>");

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