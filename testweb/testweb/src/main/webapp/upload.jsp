<%@ page import="java.io.*, javax.servlet.http.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*,
  org.apache.commons.fileupload.servlet.*" %>
  <%@ page import="java.util.List" %>
<%
  // Check if the request is a multi-part form data request
  boolean isMultipart = ServletFileUpload.isMultipartContent(request);
  
  if (isMultipart) {
    DiskFileItemFactory factory = new DiskFileItemFactory();
    factory.setSizeThreshold(4096); 
    ServletFileUpload upload = new ServletFileUpload(factory);
    
    try {
      List<FileItem> items = upload.parseRequest(request);
      
      for (FileItem item : items) {
        if (!item.isFormField()) {
          String fileName = item.getName();
          String uploadDir = "c:/writable/";
          File uploadedFile = new File(uploadDir, fileName);
          item.write(uploadedFile);
          response.sendRedirect("success.jsp");
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
      response.sendRedirect("error.jsp");
    }
  } else {

    response.sendRedirect("error.jsp");
  }
%>
