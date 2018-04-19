package web;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

/**
 * Servlet implementation class loginservlet
 */

public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf8");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
	     try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hitclass","root","12345678");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from student");
				ResultSet ad = stmt.executeQuery("select * from admin");
				String uername=null;
				String password;
				String Myuername=request.getParameter("myusername");
				String Mypassword=request.getParameter("mypassword");
				boolean isMatch=false;
				while(ad.next()) {
					uername=ad.getString(1);
					password=ad.getString(2);
					if(uername.equals(Myuername)) {
						if(password.equals(Mypassword)) {
							isMatch=true;
							break;
						}
					}
				}
				out.print(isMatch);
			//	HttpSession session = request.getSession();
			//	session.setAttribute("uername",uername);
				if (isMatch) {
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				else {
					request.getRequestDispatcher("login.html").forward(request, response);
				}
				
				con.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();	
			}
			
	}

}


