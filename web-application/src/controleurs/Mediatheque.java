package controleurs;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.Config;
import modeles.Document;

/**
 * Servlet implementation class Hibernate
 */
@WebServlet(name = "mediatheque", urlPatterns = { "/mediatheque" })
public class Mediatheque extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VUE = "/vues/mediatheque/";
    
	/** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Action demandée par l'utilisateur
		String action = request.getParameter("action");

		// Vue par défaut
		String vue = VUE + "index.jsp";
		
		try{
			switch(action){
				case "list" : 
					Session session = new Config().getSession();
					Query query = session.createQuery("FROM Document");
					List<Document> listeDocs = query.list();
					request.setAttribute("documents", listeDocs);
					vue = VUE + "listDocument.jsp";
					break;
					
				case "delay" : 
					vue = "delay.jsp";
					break;
			}
			
		}catch(Exception e){
			vue = "/vues/exception/exception.jsp";
			request.setAttribute("message", e.getLocalizedMessage());
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(vue);
		dispatcher.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}

