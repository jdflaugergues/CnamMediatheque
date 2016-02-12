<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:simple_layout title="Liste de documents">
	<jsp:attribute name="body_area"> %>

	    <!-- Column Right-->
       <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

          <!-- BreadCrumb -->
          <ol class="breadcrumb">
            <li><a href='<c:url value="/vues/index.jsp"/>'>Accueil</a></li>
            <li class="active">Document empruntés</li>
          </ol>

          <!-- Content -->
          <div class="content">
            <div class="container">

				<h3 id="q1">[ Documents empruntés ] <span class="label label-default">DVD, Périodiques, Livres</span></h3>
              

              <table class="table table-striped">
              	<thead>
              		<tr>
              			<th>Titre</th>
              			<th>Abonné</th>
              			<th>Date d'emprunt</th>
              			<th>Date de retour max</th>
              			<th>Retard</th>
              		</tr>
              	</thead>
				 <c:forEach items="${requestScope.reservations}" var="reservation">
				 	
				 	 <jsp:useBean id="now" class="java.util.Date"/>
					 <c:set var="deadline" scope="session" value="${reservation.getDeadline()}"/>
					 <c:set var="retard" scope="session" value="${deadline lt now}"/>
				 				 
					<tr <c:if test="${retard == true}">class="table-danger"</c:if> >
					
						<td><a href='<c:url value="/mediatheque"><c:param name="action" value="item"/><c:param name="id" value="${reservation.pk.document.id}"/></c:url>'>
							<c:out value="${reservation.pk.document.titre}" />
						</a></td>
						<td><c:out value="${reservation.pk.abonne.prenom} ${reservation.pk.abonne.nom}" /></td>
						<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${reservation.date}" /></td>
						<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${deadline}" /></td>
						<td><fmt:parseNumber value="${(now.time - deadline.time) / (1000*60*60*24) }" integerOnly="true" /> jours</td>
					</tr>
				</c:forEach>
			  </table>

            </div> <!-- /container -->
          </div> <!-- /content -->


        </div><!-- Column Right-->


	</jsp:attribute>
</t:simple_layout>

<script>$('#borrowed').attr('class','active')</script>
