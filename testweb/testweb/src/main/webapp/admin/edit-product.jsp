<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
if(request.getParameter("saveType")!=null){
    String product_id = request.getParameter("id");
    String product_title =request.getParameter("product_title");
    String product_price =request.getParameter("product_price");
    String product_description =request.getParameter("product_description");
    int res=0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String q;
        String sql = "update products set product_title='"+product_title+"',product_price='"+product_price+"',product_description='"+product_description+"' where product_id=" + product_id;
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

String product_id = request.getParameter("id");
String product_title ="";
String product_price ="";
String product_description ="";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        Statement stmt = connection.createStatement();
        String sql = "select * from products where product_id="+product_id;
        ResultSet rs = stmt.executeQuery(sql);
        

        while (rs.next()) {
           // product_id = rs.getInt("product_id");
            product_title = rs.getString("product_title");
            product_price = rs.getString("product_price");
            product_description = rs.getString("product_description");
        }
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>

<jsp:include page="header.jsp"/>
<h1 class="h3 mb-4 text-gray-800">Products</h1>
<div class="card">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Edit Product</h6>
    </div>
    <form id="norm_form" method="post" action="">
        <input type="hidden" name="saveType" id="saveType" value="1">
        <input type="hidden" name="id" id="id" value="<%out.print(product_id);%>">
        <div class="card-body">
    
            <div class="row">
    
                <div class="col-md-4">
                    <div class="form-group ">
                        <label for="name" class="control-label">Product Title</label>
                        <input type="text" id="product_title" name="product_title" class="form-control"
                            aria-describedby="product_title" value="<%out.print(product_title);%>">
    
                    </div>
                </div>
    
                <div class="col-md-4">
                    <div class="form-group ">
                        <label for="name" class="control-label">Product Price</label>
                        <input type="url" id="product_price" name="product_price" class="form-control"
                            aria-describedby="product_price" value="<%out.print(product_price);%>">
    
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group ">
                        <label for="name" class="control-label">Product Description</label>
                        <textarea type="text" id="product_description" name="product_description" class="form-control" aria-describedby="product_description"><%out.print(product_description);%></textarea>

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