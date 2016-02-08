<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:simple_layout title="Document">
	<jsp:attribute name="body_area"> %>

	    <!-- Column Right-->
       <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

          <!-- BreadCrumb -->
          <ol class="breadcrumb">
            <li><a href='<c:url value="/vues/index.jsp"/>'>Accueil</a></li>
            <li><a href='<c:url value="/mediatheque"><c:param name="action" value="list"/></c:url>'>Tous les documents</a></li>
            <li class="active">Document</li>
          </ol>

          <!-- Content -->
          <div class="content">
            <div class="container">

              <h3 id="q1">[ <c:out value="${document.type.nom}" /> ] 
              	<span class="label label-default"><c:out value="${document.titre}" /></span>
              </h3>
              
              <br>
              
              	<form class="form-horizontal">
              		<div class="row">
              			<div class="col-md-6 form-group">
              				<c:if test='${document.getClass().getSimpleName() == "Periodique"}' >
	              				<label class="col-sm-2 control-label">Num�ro</label>
						    	<div class="col-sm-10">
						      		<p class="form-control-static"><c:out value="${document.numero}" /></p>
						    	</div>
					    	</c:if>
					    	<c:if test='${document.getClass().getSimpleName() == "DVD"}' >
	              				<label class="col-sm-2 control-label">R�alisateur</label>
						    	<div class="col-sm-10">
						      		<p class="form-control-static"><c:out value="${document.realisateur}" /></p>
						    	</div>
					    	</c:if>
					    	<c:if test='${document.getClass().getSimpleName() == "Livre"}' >
	              				<label class="col-sm-2 control-label">Auteur</label>
						    	<div class="col-sm-10">
						      		<p class="form-control-static"><c:out value="${document.auteur}" /></p>
						    	</div>
					    	</c:if>
              			</div>
              			<div class="col-md-6 form-group">
              				<label class="col-sm-6 control-label">Date de parution</label>
					    	<div class="col-sm-6">
					      		<p class="form-control-static"><c:out value="${document.dateParution}" /></p>
					    	</div>
              			</div>
					</div>
					
					<div class="row">
              			<div class="col-md-6 form-group">
              				<c:if test='${document.getClass().getSimpleName() == "DVD"}' >
	              				<label class="col-sm-2 control-label">Genre</label>
						    	<div class="col-sm-10">
						      		<p class="form-control-static"><c:out value="${document.genre}" /></p>
						    	</div>
					    	</c:if>
					    	<c:if test='${document.getClass().getSimpleName() == "Livre"}' >
	              				<label class="col-sm-2 control-label">Editeur</label>
						    	<div class="col-sm-10">
						      		<p class="form-control-static"><c:out value="${document.editeur}" /></p>
						    	</div>
					    	</c:if>
              			</div>
              			<div class="col-md-6 form-group">
              				<c:if test='${document.getClass().getSimpleName() == "DVD"}' >
	              				<label class="col-sm-6 control-label">Dur�e</label>
						    	<div class="col-sm-6">
						      		<p class="form-control-static"><c:out value="${document.duree}" /> minutes</p>
						    	</div>
					    	</c:if>
					    	<c:if test='${document.getClass().getSimpleName() == "Livre"}' >
	              				<label class="col-sm-6 control-label">Nombre de pages</label>
						    	<div class="col-sm-6">
						      		<p class="form-control-static"><c:out value="${document.nbPages}" /> pages</p>
						    	</div>
					    	</c:if>
              			</div>
					</div>
					
					<c:if test='${document.getClass().getSimpleName() == "Livre"}' >
						<div class="row">
	              			<div class="col-md-6 form-group">
	              				<label class="col-sm-2 control-label">ISBN</label>
						    	<div class="col-sm-10">
						      		<p class="form-control-static"><c:out value="${document.isbn}" /></p>
						    	</div>
	              			</div>
						</div>
					</c:if>
					
				</form>
				
				<a class="btn btn-primary" href='<c:url value="/mediatheque"><c:param name="action" value="reserve"/><c:param name="id" value="1"/></c:url>' role="button">R�server adulte (John Doe)</a>
				<a class="btn btn-primary" href='<c:url value="/mediatheque"><c:param name="action" value="reserve"/><c:param name="id" value="2"/></c:url>' role="button">R�server adulte (Dave Montana)</a>
				<a class="btn btn-success" href='<c:url value="/mediatheque"><c:param name="action" value="reserve"/><c:param name="id" value="3"/></c:url>' role="button">R�server enfant (Nicolas Sitbon)</a>
				<a class="btn btn-success" href='<c:url value="/mediatheque"><c:param name="action" value="reserve"/><c:param name="id" value="4"/></c:url>' role="button">R�server enfant (Pascal Debard)</a>
				
            </div> <!-- /container -->
          </div> <!-- /content -->


        </div><!-- Column Right-->


	</jsp:attribute>
</t:simple_layout>

<script>$('#list').attr('class','active')</script>
