<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<jsp:include page="header.jsp"/>
<h1 class="h3 mb-4 text-gray-800">User Commisions</h1>
<div class="card">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">User Commisions</h6>

    </div>
    <div class="card-body">

 
<div class="table-responsive">
<table class="table ">
    <thead>
        <th>Sr.No.</th>
        <th>Date</th>
        <th>Amount</th>
    </thead>
    <tbody>
<%
String user_id = request.getParameter("id"); 
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");
        java.util.Date currentDate = new java.util.Date();
        
        // Create a SimpleDateFormat object with the desired format
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        Statement stmt = connection.createStatement();
        String sql = "select * from commissions where user_id="+user_id;
        ResultSet rs = stmt.executeQuery(sql);
        int i=1;
        while (rs.next()) {           
            String date = rs.getString("date");
            String amount = rs.getString("amount");
            //String formattedDate = sdf.format(date);
            
            out.println("<tr>" +"<td>" + i + "</td><td>" + date + "</td>" + "<td>" + amount + "</td></tr>");
			i++;
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