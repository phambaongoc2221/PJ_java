package Control;

import DAO.FoodDAO;
import Entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SignupControl", urlPatterns = {"/signup"})
public class SignupControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm-password");
        if(!password.equals(confirm_password)){
            request.setAttribute("mess","Không thể đăng ký - Mật khẩu không khớp!");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else {
            FoodDAO dao = new FoodDAO();
            Account account = dao.checkAccount(username);
            if(account == null){
                dao.signup(username,password);
                response.sendRedirect("/");
            }else{
                request.setAttribute("mess","Không thể đăng ký - Tên người dùng đã tồn tại!");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
