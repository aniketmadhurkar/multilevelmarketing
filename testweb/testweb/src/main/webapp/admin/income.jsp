<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="header.jsp"/>
<h1 class="h3 mb-4 text-gray-800">Income </h1>
<div class="card">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Income </h6>

    </div>
    <div class="card-body">

 
<div class="table-responsive">
<table class="table ">
    <thead>
        <th>Sr.No.</th>
        <th>User Name</th>
        <th>Amount</th>
        <th>Account</th>
        <th>Send</th>
    </thead>
    <tbody>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String q;
        String sql = "select * from income where current_bal>=100;";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            String user_id = rs.getString("user_id");
            String amount = rs.getString("current_bal");
            String date = rs.getString("date");
            out.println("<tr>" + "<td>" + user_id + "</td>" + "<td>" + amount + "</td>" + "<td>" + date + "</td></tr>");

        }
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

    Statement stmt = connection.createStatement();
ResultSet queryResult = stmt.executeQuery("select * from income where current_bal>=100");
if (queryResult.next()) {
    int i = 1;
    do {
        String userId = queryResult.getString("userid");
        int amount = queryResult.getInt("current_bal");

        ResultSet userResult = stmt.executeQuery("select * from user where email='" + userId + "'");
        if (userResult.next()) {
            String account = userResult.getString("account");
%>
            <tr>
                <td><%= i %></td>
                <td><%= userId %></td>
                <td><%= amount %></td>
                <td><%= account %></td>
                <td><a href="income.jsp?userid=<%= userId %>&amount=<%= amount %>">Send</a></td>
            </tr>
<%
        }
        i++;
    } while (queryResult.next());
} else {
%>
    <tr>
        <td colspan="5">No user exist</td>
    </tr>
<%
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