package DAO;

import Entity.Food;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FoodDAO {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodweb", "root", "Phambaongoc2221");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
    public static List<Food> getAllFood() {
        List<Food> list = new ArrayList<Food>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from food");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Food food = new Food();
                food.setId(rs.getInt("id"));
                food.setName(rs.getString("name"));
                food.setImage(rs.getString("image"));
                food.setPrice(rs.getFloat("price"));
                food.setScript(rs.getString("script"));
                list.add(food);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }


    public static Food getFoodByID(String id) {
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from food where id = ?;");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Food(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getFloat(4),
                            rs.getString(5));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public static List<Food> getFoodByName(String txtSearch) {
        List<Food> list = new ArrayList<Food>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from food where name like ?");
            ps.setString(1, "%" + txtSearch +"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Food food = new Food();
                food.setId(rs.getInt("id"));
                food.setName(rs.getString("name"));
                food.setImage(rs.getString("image"));
                food.setPrice(rs.getFloat("price"));
                food.setScript(rs.getString("script"));
                list.add(food);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        FoodDAO dao = new FoodDAO();
        List<Food> list = dao.getFoodByName("Bánh");
        for(Food food : list){
            System.out.println(food);
        }
    }



}
