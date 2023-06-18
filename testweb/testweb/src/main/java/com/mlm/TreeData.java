package com.mlm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class TreeData {
    public HashMap<String, Integer> treeData(String userid, Connection con) {
        HashMap<String, Integer> data = new HashMap<>();
        try {
            String query = "SELECT * FROM tree WHERE user_id = ?";
            PreparedStatement stmt = con.prepareStatement(query);
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
        }
        return data;
    }
}
