package com.mlm;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import java.sql.*;

import java.sql.Connection;

public class UserData {
    public String getTotalNoOfUsers(String under_user_id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/c_mllm", "root", "");
            String query = "SELECT COUNT(*) AS total_recipients\r\n"
            		+ "FROM members\r\n"
            		+ "WHERE under_user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, under_user_id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("total_recipients");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "0";
    }
    public String DivideCommision(String under_user_id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/c_mllm", "root", "");
            String query = "SELECT COUNT(*) AS total_recipients\r\n"
            		+ "FROM members\r\n"
            		+ "WHERE under_user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, under_user_id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("total_recipients");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "0";
    }
    public String AddUser(String under_user_id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/c_mllm", "root", "");
            String query = "SELECT COUNT(*) AS total_recipients\r\n"
            		+ "FROM members\r\n"
            		+ "WHERE under_user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, under_user_id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("total_recipients");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "0";
    }
}
