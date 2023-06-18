<%@ page import="java.sql.*" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="net.sf.json.JSONObject" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mlm.JoinUser"%>
<% 
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");

String user_name = request.getParameter("user_name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String account = request.getParameter("account");
String referral_id = request.getParameter("referral_id");
String side = request.getParameter("side");
String password =  request.getParameter("password");

String user_id ="";
    
%>

<%
String userid = (String) session.getAttribute("userid");
int capping = 500;
%>

<%

if(request.getParameter("email") != null){

	 int lastInsertedId =0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/c_mllm", "root", "");
        JoinUser joinUser=new JoinUser();
	int flag = 0;
	if( email != null && mobile != null &&  account != null && referral_id != null && side != null){
		flag=1;
	}

	if( referral_id == null ||referral_id=="0"){
		 referral_id =""; 
	}
	if(flag == 1){
		
		//Insert into User profile
		String query = "insert into users(user_name,email, password, mobile,  account_number, referral_id, side) values(?,?, ?,  ?, ?, ?, ?)";
		PreparedStatement stmt = con.prepareStatement(query);
		stmt.setString(1, user_name);
		stmt.setString(2, email);
		stmt.setString(3, password);
		stmt.setString(4, mobile);
		stmt.setString(5, account);
		stmt.setInt(6, Integer.parseInt(referral_id));
		stmt.setString(7, side);
		 int rowsAffected = stmt.executeUpdate();
		   if (rowsAffected > 0) {
		        ResultSet generatedKeys = stmt.getGeneratedKeys();
		        
		        if (generatedKeys.next()) {
		            // Get the last inserted ID
		             lastInsertedId = generatedKeys.getInt(1);
		            
		        }
		        
		        generatedKeys.close();
		    }

		   if(Integer.parseInt(referral_id)>0){
				//query = "INSERT INTO commissions (user_id, amount) SELECT id, 5000 / (SELECT COUNT(*) FROM users WHERE referral_id = ?) AS commission FROM users WHERE referral_id =?";
				
				ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) as total_users  FROM users WHERE referral_id ="+referral_id);
				int total_users=1;
				
				if (rs2.next()) {
					total_users=rs2.getInt("total_users");
				}

				float bonus=(5000 /(total_users+1));
				
				query = "INSERT INTO commissions (user_id, amount) values(?, ?)";
				stmt = con.prepareStatement(query);
				stmt.setString(1, ""+lastInsertedId);
				stmt.setFloat(2, bonus);
				stmt.executeUpdate();	
				
				query = "INSERT INTO commissions (user_id, amount) SELECT u.id, "+bonus+" FROM users u WHERE u.id = ?;";
				stmt = con.prepareStatement(query);
				stmt.setString(1, referral_id);
				stmt.executeUpdate();		
				
				
				query = "INSERT INTO user_tree (user_id, parent_id, level)	SELECT u.id, u.referral_id, g.level + 1 FROM users u JOIN user_tree g ON u.referral_id = g.user_id WHERE u.id =?";
				stmt = con.prepareStatement(query);
				stmt.setString(1, ""+lastInsertedId);
				stmt.executeUpdate();				
		   }
		   else{
			   query = "INSERT INTO commissions (user_id, amount) values(?, 5000)";
				stmt = con.prepareStatement(query);
				stmt.setString(1, ""+lastInsertedId);
				stmt.executeUpdate();		
		   }
		

	     String clientOrigin = request.getHeader("origin");
         response.setHeader("Access-Control-Allow-Origin", clientOrigin);
         response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
         response.setHeader("Access-Control-Allow-Headers", "Content-Type");
         response.setContentType("application/json");
         response.getWriter().write("{\"logged_in\":\"" + "1" + "\",\"user_id\":\"" + lastInsertedId + "\",\"user_name\":\"" + user_name + "\"}");
	}
	else{
		 String clientOrigin = request.getHeader("origin");
         response.setHeader("Access-Control-Allow-Origin",  "true");
         response.setHeader("Access-Control-Allow-Origin", clientOrigin);
         response.setHeader("Access-Control-Allow-Methods", "POST");
         response.setHeader("Access-Control-Allow-Headers", "Content-Type");
         response.setHeader("Access-Control-Max-Age", "86400");
         response.setContentType("application/json");
         response.getWriter().write("{\"logged_in\":\"" + "0" + "\",\"user_id\":\"" + "0" + "\",\"user_name\":\"" + user_name + "\"}");
	}
    
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>