<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
if(request.getParameter("saveType")!=null){
    String service_title =request.getParameter("service_title");
    String service_url =request.getParameter("service_url");
    int res=0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String q;
        String sql = "insert into services (service_title,service_url) values('"+service_title+"','"+service_url+"')";
        res = stmt.executeUpdate(sql);
        if (res >0) {
            out.print("<div class='col-md-12 mt-2'><div class='alert alert-success' role='alert'>Successfully Added!.</div></div>");
        } else {
            out.print("<div class='col-md-12 mt-2'><div class='alert alert-danger' role='alert'>Not Added!</div></div>");
        }
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }
}


%>
<jsp:include page="header.jsp"/>
<h1 class="h3 mb-4 text-gray-800">Services</h1>
<div class="card">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Add Service</h6>
    </div>
    <form id="norm_form" method="post" action="add-service.jsp">
        <input type="hidden" name="saveType" id="saveType" value="1">
        <div class="card-body">
    
            <div class="row">
    
                <div class="col-md-4">
                    <div class="form-group ">
                        <label for="name" class="control-label">Service Title</label>
                        <input type="text" id="service_title" name="service_title" class="form-control"
                            aria-describedby="service_title" value="">
    
                    </div>
                </div>
    
                <div class="col-md-4">
                    <div class="form-group ">
                        <label for="name" class="control-label">Service Url</label>
                        <input type="url" id="service_url" name="service_url" class="form-control"
                            aria-describedby="service_url">
    
                    </div>
                </div>
    
            </div>
        </div>
        <div class="card-footer">
            <button type="submit" id="btnSubmit" class="btn btn-success">Submit</button>
        </div>
    </form>

</div>
<jsp:include page="footer.jsp"/>