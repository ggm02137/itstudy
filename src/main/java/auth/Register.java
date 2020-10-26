package auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // mariadb 연결정보
    private final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
    private final String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_ggm02137";
    private final String DB_USER = "ggm02137";
    private final String DB_PASSWORD = "tDYFzzDh9FosAQf0";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 사용자로부터 입력받은 파라미터
        // 아이디, 비밀번호, 이름, 이메일, 전화번호
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // SQL 변수
        Connection conn = null;
        Statement state = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            state = conn.createStatement();

            String sql;
            sql = "INSERT INTO TB_USER (ID, PASSWORD, NAME, EMAIL, PHONE)";
            sql += " VALUES ";
            sql += "(?, ?, ?, ?, ?)";

            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setString(2, password);
                pstmt.setString(3, name);
                pstmt.setString(4, email);
                pstmt.setString(5, phone);
                pstmt.executeUpdate();
            } catch(Exception e) {
                System.out.println("executeUpdate error: " + e.toString());
            }
        } catch(Exception e) {
            System.out.println("DB Connection error: " + e.toString());
        } finally {
            try {
                if (state != null) {
                    state.close();
                }
            } catch(SQLException e) {
                System.out.println("state close error: " + e.toString());
            }

            try {
                if (conn != null) {
                    conn.close();
                }
            } catch(SQLException e) {
                System.out.println("DB Connection Close error: " + e.toString());
            }
        }

        response.sendRedirect("auth/login.jsp");
    }

}

