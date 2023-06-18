<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="java.util.stream.*" %>
<%@ page import="java.io.*, javax.servlet.http.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*,
  org.apache.commons.fileupload.servlet.*" %>
  <%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
String UPLOAD_DIRECTORY = "C:\\Users\\admin\\eclipse-workspace\\testweb\\images\\";
	String product_title = null;
	String product_price = null;
	String product_description = null;
	String imagePath=null;
	 String fileName="";
	 
Connection connection = null;
Statement stmt=null;


try {
    // Create a FileItemFactory and ServletFileUpload instance
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    // Parse the request to get the list of FileItems
    List<FileItem> items = upload.parseRequest(request);

    for (FileItem item : items) {
        if (!item.isFormField()) {
        	
        	 
            fileName = new File(item.getName()).getName();

            // Save the file to the specified upload directory
            item.write(new File(UPLOAD_DIRECTORY + File.separator + fileName));
            
        }
        else{
        	if (item.getFieldName().equals("product_title")) {
        		product_title = item.getString();
            } else if (item.getFieldName().equals("product_price")) {
            	product_price = item.getString();
            } else if (item.getFieldName().equals("product_description")) {
            	product_description = item.getString();
            }
        
        }
    }
    
    int res=0;
    try {
    	  Class.forName("com.mysql.jdbc.Driver");
        connection =  DriverManager.getConnection( "jdbc:mysql://localhost:3306/c_mllm", "root", "");

        stmt = connection.createStatement();
        String sql = "insert into products (product_title,product_price,product_description,product_image) values('"+product_title+"','"+product_price+"','"+product_description+"','"+fileName+"')";
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
    finally {
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} catch (Exception ex) {
    // Handle any exceptions that occur during file upload
    request.setAttribute("message", "File Upload Failed due to " + ex);
}

%>
<jsp:include page="header.jsp"/>
<h1 class="h3 mb-4 text-gray-800">Products</h1>
<div class="card">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Add Product</h6>
    </div>
    <form id="norm_form" method="post" action=""   enctype="multipart/form-data">
        <input type="hidden" name="saveType" id="saveType" value="1">
        <div class="card-body">
    
            <div class="row">
    
                <div class="col-md-4">
                    <div class="form-group ">
                        <label for="name" class="control-label">Product Title</label>
                        <input type="text" id="product_title" name="product_title" class="form-control" aria-describedby="product_title" value="">

                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ">
                        <label for="name" class="control-label">Product Price</label>
                        <input type="text" id="product_price" name="product_price" class="form-control" aria-describedby="product_price" value="">

                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ">
                        <label for="name" class="control-label">Product Description</label>
                        <textarea type="text" id="product_description" name="product_description" class="form-control" aria-describedby="product_description"></textarea>

                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ">
                        <label for="name" class="control-label">Product Image</label>
                        <input type="file" id="product_image" name="product_image" class="form-control" aria-describedby="product_image">

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

<%!
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
%>

<%!
    private void saveFile(InputStream inputStream, String filePath) throws IOException {
        FileOutputStream outputStream = null;
        try {
            outputStream = new FileOutputStream(new File(filePath));
            int bytesRead;
            byte[] buffer = new byte[8192];
            while ((bytesRead = inputStream.read(buffer, 0, 8192)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
            if (outputStream != null) {
                outputStream.close();
            }
        }
    }
%>