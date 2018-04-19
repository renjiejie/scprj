package web;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class information extends HttpServlet {
	  public void doGet(HttpServletRequest request, HttpServletResponse response)
			    throws ServletException,IOException { 
			     response.setContentType("text/html;charset=UTF-8");
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
						String Myuername=request.getParameter("id");
						String Mypassword=request.getParameter("password");
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
							request.setAttribute("Mypassword", "Mypassword");
							request.setAttribute("Myuername", Myuername);
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
