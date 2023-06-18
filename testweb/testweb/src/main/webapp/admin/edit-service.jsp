<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
if(request.getParameter("saveType")!=null){
    String service_id = request.getParameter("id");
    String service_title =request.getParameter("service_title");
    String service_url =request.getParameter("service_url");
    int res=0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String q;
        String sql = "update services set service_title='"+service_title+"',service_url='"+service_url+"' where service_id=" + service_id;
        res = stmt.executeUpdate(sql);
        if (res >0) {
            out.print("<div class='col-md-12 mt-2'><div class='alert alert-success' role='alert'>Successfully Updated!.</div></div>");
        } else {
            out.print("<div class='col-md-12 mt-2'><div class='alert alert-danger' role='alert'>Not Updated!</div></div>");
        }
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

String service_id = request.getParameter("id");
String service_title ="";
String service_url ="";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String q;
        String sql = "select * from services where service_id="+service_id;
        ResultSet rs = stmt.executeQuery(sql);
        

        while (rs.next()) {
           // service_id = rs.getInt("service_id");
            service_title = rs.getString("service_title");
            service_url = rs.getString("service_url");
        }
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>

<jsp:include page="header.jsp"/>
<h1 class="h3 mb-4 text-gray-800">Services</h1>
<div class="card">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Edit Service</h6>
    </div>
    <form id="norm_form" method="post" action="">
        <input type="hidden" name="saveType" id="saveType" value="1">
        <input type="hidden" name="id" id="id" value="<%out.print(service_id);%>">
        <div class="card-body">
    
            <div class="row">
    
                <div class="col-md-4">
                    <div class="form-group ">
                        <label for="name" class="control-label">Service Title</label>
                        <input type="text" id="service_title" name="service_title" class="form-control"
                            aria-describedby="service_title" value="<%out.print(service_title);%>">
    
                    </div>
                </div>
    
                <div class="col-md-4">
                    <div class="form-group ">
                        <label for="name" class="control-label">Service Url</label>
                        <input type="url" id="service_url" name="service_url" class="form-control"
                            aria-describedby="service_url" value="<%out.print(service_url);%>">
    
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