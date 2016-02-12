<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:simple_layout title="Liste de documents">
	<jsp:attribute name="body_area"> %>

	    <!-- Column Right-->
       <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

          <!-- BreadCrumb -->
          <ol class="breadcrumb">
            <li><a href='<c:url value="/vues/index.jsp"/>'>Accueil</a></li>
            <li class="active">Tous les documents</li>
          </ol>

          <!-- Content -->
          <div class="content">
            <div class="container">

              <h3 id="q1">[ Tous les documents ] <span class="label label-default">DVD, Périodiques, Livres</span></h3>
              
              <c:if test="${reservedOK == true }">
              	<div class = "alert alert-success">La réservation a bien été effectuée par ${abonne.prenom} ${abonne.nom}.</div>
              </c:if>
              
              <c:if test="${takebackOK == true }">
              	<div class = "alert alert-success">Le document a bien été rendu par ${abonne.prenom} ${abonne.nom}.</div>
              </c:if>              
              
              <c:if test="${cantReserved == true}">
              	<div class = "alert alert-danger">La réservation est impossible car ${reserver.prenom} ${reserver.nom} à atteint sa limite de document réservé.</div>
              </c:if>

              <table class="table table-striped">
              	<thead>
              		<tr>
              			<th>Titre</th>
              			<th>Date de parution</th>
              			<th>Type</th>
              			<th>Adulte #1</th>
              			<th>Adulte #2</th>
              			<th>Enfant #1</th>
              			<th>Enfant #2</th>
              		</tr>
              	</thead>
				 <c:forEach items="${requestScope.documents}" var="document">
					<tr>
						<td><a href='<c:url value="/mediatheque"><c:param name="action" value="item"/><c:param name="id" value="${document.id}"/></c:url>'>
							<c:out value="${document.titre}" />
						</a></td>
						<td><c:out value="${document.dateParution}" /></td>
						<td><c:out value="${document.type.nom}" /></td>
						<c:if test="${document.getReserver() == null}">
							<td><a class="btn btn-primary" href='<c:url value="/mediatheque"><c:param name="documentId" value="${document.id}"/><c:param name="action" value="reserve"/><c:param name="jsp" value="listDocument"/><c:param name="abonneId" value="1"/></c:url>' role="button">Réser. J Doe</a></td>
							<td><a class="btn btn-primary" href='<c:url value="/mediatheque"><c:param name="documentId" value="${document.id}"/><c:param name="action" value="reserve"/><c:param name="jsp" value="listDocument"/><c:param name="abonneId" value="2"/></c:url>' role="button">Réser. D Montana</a></td>
							<td><a class="btn btn-success" href='<c:url value="/mediatheque"><c:param name="documentId" value="${document.id}"/><c:param name="action" value="reserve"/><c:param name="jsp" value="listDocument"/><c:param name="abonneId" value="3"/></c:url>' role="button">Réser. P Debard</a></td>
							<td><a class="btn btn-success" href='<c:url value="/mediatheque"><c:param name="documentId" value="${document.id}"/><c:param name="action" value="reserve"/><c:param name="jsp" value="listDocument"/><c:param name="abonneId" value="4"/></c:url>' role="button">Réser. N Sitbon</a></td>
						</c:if>
						<c:if test="${document.getReserver() != null}">
							<c:if test="${document.getReserver().id == 1}"></c:if>
							<c:if test="${document.getReserver().id == 2}"><td></td></c:if>
							<c:if test="${document.getReserver().id == 3}"><td></td><td></td></c:if>
							<c:if test="${document.getReserver().id == 4}"><td></td><td></td><td></td></c:if>
							
							<td><a class="btn btn-warning" href='<c:url value="/mediatheque">
								<c:param name="action" value="takeback"/>
								<c:param name="jsp" value="listDocument"/>
								<c:param name="documentId" value="${document.id}"/>
								<c:param name="abonneId" value="${document.getReserver().id}"/>
							</c:url>' 
							role="button">Rendre ${fn:substring(document.getReserver().prenom, 0, 1)} ${document.getReserver().nom}</a>
						</td>
							<c:if test="${document.getReserver().id == 4}"></c:if>
							<c:if test="${document.getReserver().id == 3}"><td></td></c:if>
							<c:if test="${document.getReserver().id == 2}"><td></td><td></td></c:if>
							<c:if test="${document.getReserver().id == 1}"><td></td><td></td><td></td></c:if>
						
						</c:if>
						</td>
					</tr>
				</c:forEach>
			  </table>

            </div> <!-- /container -->
          </div> <!-- /content -->


        </div><!-- Column Right-->


	</jsp:attribute>
</t:simple_layout>

<script>$('#list').attr('class','active')</script>
