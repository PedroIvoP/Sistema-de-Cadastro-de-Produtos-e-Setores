package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Rotas
 */
@WebServlet({"/inicio", "/produtos", "/setores"})
public class Rotas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Rotas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rota = request.getServletPath();
		
		switch(rota) {
		
			case "/inicio":
				inicio(request, response);
				break;
				
			case "/produtos":
				produtos(request, response);
				break;
				
			case "/setores":
				setores(request, response);
				break;
		}
	}

	
	
	protected void inicio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("inicio.jsp");
	}
	
	protected void produtos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("produtos.jsp");
	}

	protected void setores(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	response.sendRedirect("setores.jsp");
}

}
