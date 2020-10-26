package user;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/user/list")
public class UserList extends HttpServlet {
    //mariadb 연결정보
    String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
    String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_ggm02137";
    String DB_USER = "ggm02137";
    String DB_PASSWORD = "tDYFzzDh9FosAQf0";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");

        resp.setCharacterEncoding("UTF-8");


        Connection conn = null;
        Statement state = null;
        PreparedStatement pstmt = null;


        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            state = conn.createStatement();


            //사용자 목록 가져오기 sql 쿼리
            String sql = "SELECT ID, PASSWORD, NAME, EMAIL, PHONE";
            sql += "FROM TB_USER";
            sql += "ORDER BY ID DESC;";
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = null;
            rs = pstmt.executeQuery();

            if (rs == null) {
                resp.getWriter().println("null");
            } else {
                JSONArray arr = new JSONArray();
                //resp.getWriter().println(rs);
                //String jsonData = "{\"data\": [";

                while(rs.next()){
                    String id = rs.getNString("ID");
                    String password = rs.getNString("PASSWORD");
                    String name = rs.getNString("NAME");
                    String email = rs.getNString("EMAIL");
                    String phone = rs.getNString("PHONE");

                    JSONObject obj = new JSONObject();
                    obj.put("id",id);
                    obj.put("password",password);
                    obj.put("name",name);
                    obj.put("email", email);
                    obj.put("phone", phone);
                    arr.add(obj);
                    //jsonData += "{\"ID\":" + id + "\"}";
                }
                JSONObject data = new JSONObject();
                data.put("data",arr);
                System.out.println(data);
                //resp.getWriter().println(data);
            }
            rs.close();

        } catch (Exception e) {
            resp.getWriter().println(e);
        } finally {
          try{
              state.close();
              conn.close();
          } catch (SQLException throwables){
              throwables.printStackTrace();
          }
        }
    }
}
