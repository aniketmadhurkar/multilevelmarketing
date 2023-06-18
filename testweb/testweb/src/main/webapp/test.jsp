<td>{item.quantity}</td><%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
   <head>
      <title>SELECT Operation 1</title>
   </head>

   <body>
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/c_mllm"
         user = "root"  password = ""/>
         <sql:update dataSource = "${snapshot}" var = "result">
            INSERT INTO products (  product_title ,  product_price ,  product_description ) VALUES ( 'book title',200, 'book desc');
         </sql:update>
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from products;
      </sql:query>
 
      <table border = "1" width = "100%">
         <tr>
            <th>Emp ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.product_id}"/></td>
               <td><c:out value = "${row.product_title}"/></td>
               <td><c:out value = "${row.product_price}"/></td>
               <td><c:out value = "${row.product_description}"/></td>
            </tr>
         </c:forEach>
      </table>
 
   </body>
</html>