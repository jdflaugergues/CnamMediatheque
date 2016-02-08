<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
              

              <table class="table table-striped">
              	<thead>
              		<tr>
              			<th>Titre</th>
              			<th>Date de parution</th>
              			<th>Type</th>
              		</tr>
              	</thead>
				 <c:forEach items="${requestScope.documents}" var="document">
					<tr>
						<td><a href='<c:url value="/mediatheque"><c:param name="action" value="item"/><c:param name="id" value="${document.id}"/></c:url>'>
							<c:out value="${document.titre}" />
						</a></td>
						<td><c:out value="${document.dateParution}" /></td>
						<td><c:out value="${document.type.nom}" /></td>
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
