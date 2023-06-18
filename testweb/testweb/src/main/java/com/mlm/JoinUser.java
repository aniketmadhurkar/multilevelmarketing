package com.mlm;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import java.sql.*;

import java.sql.Connection;

public class JoinUser {

    public boolean email_check(String email) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/c_mllm", "root", "");
            String query = "select * from user where email = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return false;
            } else {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         return false;
    }

    public boolean side_check(String email, String side) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/c_mllm", "root", "");
            String query = "select * from tree where user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String side_value = rs.getString(side);
                if (side_value.equals("")) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         return false;
    }

    public HashMap<String, Integer> income(String userid) {
        HashMap<String, Integer> data = new HashMap<String, Integer>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/c_mllm", "root", "");
            String query = "select * from income where user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, userid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                data.put("day_bal", rs.getInt("day_bal"));
                data.put("current_bal", rs.getInt("current_bal"));
                data.put("total_bal", rs.getInt("total_bal"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return data;
    }

    public HashMap<String, Integer> tree(String userid) {
        HashMap<String, Integer> data = new HashMap<String, Integer>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/c_mllm", "root", "");
            String query = "select * from tree where user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, userid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                data.put("left", rs.getInt("left"));
                data.put("right", rs.getInt("right"));
                data.put("leftcount", rs.getInt("leftcount"));
                data.put("rightcount", rs.getInt("rightcount"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return data;
    }

    public String getReferralId(String userid) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/c_mllm", "root", "");
            String query = "select * from user where email = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, userid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("referral_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "";
    }

    public String getReferralIdPlace(String userid) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/c_mllm", "root", "");
            String query = "select * from user where email = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, userid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("side");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "";
    }
}
