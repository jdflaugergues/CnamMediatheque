package controleurs;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.Action;
import modeles.Abonne;
import modeles.Document;
import modeles.Reservation;

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
				
				// Afficher la liste des documents
				case "list" : 
					List<Document> listeDocs = Action.getListDocument();
					request.setAttribute("documents", listeDocs);
					vue = VUE + "listDocument.jsp";
					break;
				
				// Afficher les détails d'un document
				case "item" :
					int itemId = Integer.parseInt(request.getParameter("id"));
					Document doc = Action.getDocument(itemId);
					request.setAttribute("document", doc);
					request.setAttribute("reserver", doc.getReserver());
					vue = VUE + "document.jsp";
					break;
				
				// Emprunter un document
				case "reserve" :
					String jsp = request.getParameter("jsp");
					int documentId = Integer.parseInt(request.getParameter("documentId"));
					int abonneId = Integer.parseInt(request.getParameter("abonneId"));
					
					Document document = Action.getDocument(documentId);
					Abonne abonne = Action.getAbonne(abonneId);
					
					// On vérifie que l'abonné peut réserver le document
					boolean canReserved = abonne.canReservedDocument(document);
					
					if (canReserved){
						Action.reserve(document,abonne);
						request.setAttribute("reservedOK", true);
						
					}else{
						request.setAttribute("reservedOK", false);
					}
					
					request.setAttribute("document", document);
					request.setAttribute("abonne", abonne);
					request.setAttribute("reserver", abonne);
					request.setAttribute("cantReserved", !canReserved);
					
					if (jsp.equals("listDocument")){
						List<Document> ldocs = Action.getListDocument();
						request.setAttribute("documents", ldocs);
					}
					
					vue = VUE + jsp + ".jsp";
					break;
				
				// Rendre un document
				case "takeback" :
					String tjsp = request.getParameter("jsp");
					int tbdocumentId = Integer.parseInt(request.getParameter("documentId"));
					int tbabonneId = Integer.parseInt(request.getParameter("abonneId"));
					
					Document tbdocument = Action.getDocument(tbdocumentId);
					Abonne tbabonne = Action.getAbonne(tbabonneId);
					
					Action.takeback(tbdocument,tbabonne);
					
					request.setAttribute("document", tbdocument);
					request.setAttribute("abonne", tbabonne);
					request.setAttribute("reserver", null);
					request.setAttribute("takebackOK", true);
					
					if (tjsp.equals("listDocument")){
						List<Document> ldocs = Action.getListDocument();
						request.setAttribute("documents", ldocs);
					}
					
					vue = VUE + tjsp + ".jsp";
					break;
				
				// Documents en cours de réservation
				case "borrowed" : 
					List<Reservation> reservations = Action.getDocumentBorrowed();
					request.setAttribute("reservations", reservations);
					vue = VUE + "borrowed.jsp";
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

