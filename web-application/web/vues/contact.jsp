<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:simple_layout title="Contact">
	<jsp:attribute name="body_area"> %>

 <!-- Column right -->
 <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

   <!-- BreadCrumb -->
   <ol class="breadcrumb">
     <li><a href='<c:url value="/vues/index.jsp"/>'>Accueil</a></li>
     <li class="active">Contact</li>
   </ol>

   <!-- Content -->
   <div class="content">
     <div class="container">
       <div class="page-header">
         <h1>Contact</h1>
       </div>

       <div class="panel panel-default">
         <div class="panel-heading">
           <h3 class="panel-title">Coordonnées</h3>
         </div>
         <div class="panel-body">
           <p><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Jonathan de Flaugergues
           <p><span class="glyphicon glyphicon-home" aria-hidden="true"></span> 32, Galerie de l'Arlequin - 38100 GRENOBLE</p>
           <p></p>
           <p><span class="glyphicon glyphicon-phone" aria-hidden="true"></span><a href="tel:0608042439"> 06 08 04 24 39</a></p>
           <p><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:jonathan.deflaugergues.auditeur@lecnam.net"> jonathan.deflaugergues.auditeur@lecnam.net</a></p>
         </div>
       </div>

       <div class="panel panel-default">
         <div class="panel-heading">
           <h3 class="panel-title">Infos CNAM</h3>
         </div>
         <div class="panel-body">
           <p>Login     : DE_FLAUGERGUES</p>
           <p>Matricule : FOD_0895029655W</p>
         </div>
       </div>
     </div> <!-- /container -->
   </div><!-- /content -->

 </div><!-- Column right -->


	</jsp:attribute>
</t:simple_layout>

<script>$('#contact').attr('class','active')</script>