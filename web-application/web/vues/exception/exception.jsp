<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:simple_layout title="Contact">
	<jsp:attribute name="body_area"> %>

 <!-- Column right -->
 <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

   <!-- Content -->
   <div class="content">
     <div class="container">
       <div class="page-header">
         <h1>Une erreur est survenue</h1>
       </div>
		
		<div class="alert alert-danger" role="alert">
			<i class="fa fa-exclamation-triangle fa-2x"></i>
			${requestScope.message}
		</div>
		
     </div> <!-- /container -->
   </div><!-- /content -->

 </div><!-- Column right -->


	</jsp:attribute>
</t:simple_layout>