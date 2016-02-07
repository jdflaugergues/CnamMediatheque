<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@tag description="Nav Mediatheque Template" pageEncoding="UTF-8"%>
   	    
 <!-- Column Left - Nav Bar -->
 <div class="col-sm-3 col-md-2 sidebar">
   <ul class="nav nav-sidebar">
     <li id="list"><a href='<c:url value="/mediatheque"><c:param name="action" value="list"/></c:url>'>Tous les documents</a></li>
     <li id="delay"><a href='<c:url value="/mediatheque"><c:param name="action" value="delay"/></c:url>'>Documents en retard</a></li>
   </ul>
 </div><!-- Column Left - Nav Bar -->