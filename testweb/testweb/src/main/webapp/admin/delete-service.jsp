<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="header.jsp"/>
<h1 class="h3 mb-4 text-gray-800">Service</h1>
<div class="card">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Delete Service</h6>
    </div>
    <div class="card-body">

 
<%
String service_id = request.getParameter("id");

int res=0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String q;
        String sql = "delete from services where service_id="+service_id;
        res = stmt.executeUpdate(sql);
        if (res >0) {
            out.print("<div class='col-md-12 mt-2'><div class='alert alert-success' role='alert'>Successfully Deleted!.</div></div>");
        } else {
            out.print("<div class='col-md-12 mt-2'><div class='alert alert-danger' role='alert'>Not Deleted!</div></div>");
        }
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>


</div>
</div>
<jsp:include page="footer.jsp"/>