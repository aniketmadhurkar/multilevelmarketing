<%@ page import="java.io.*,java.util.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.annotation.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "java.sql.*"%>

<%@ page import="java.nio.file.*" %>
<%@ page import="java.util.stream.*" %>
<%@ page import="java.io.*, javax.servlet.http.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*,
  org.apache.commons.fileupload.servlet.*" %>
  <%@ page import="java.util.List" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
    // Define the upload directory
    String UPLOAD_DIRECTORY = "C:\\Users\\admin\\eclipse-workspace\\testweb\\images\\";
	String product_title = null;
	String product_price = null;
	String product_description = null;
	String imagePath=null;

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
            	
            	 
                String fileName = new File(item.getName()).getName();

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
            String sql = "insert into products (product_title,product_price,product_description,product_image) values('"+product_title+"','"+product_price+"','"+product_description+"','"+imagePath+"')";
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
