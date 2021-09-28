package Control;

import DAO.FoodDAO;
import Entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        FoodDAO dao = new FoodDAO();
        Account account = dao.login(username,password);
        if(account == null){
            request.setAttribute("mess","Tên đăng nhập hoặc Mật khẩu không đúng!");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("acc",account);
            //request.getRequestDispatcher("food.jsp").forward(request,response);
            response.sendRedirect("/");
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
