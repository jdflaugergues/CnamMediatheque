<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<%@tag description="Simple Template" pageEncoding="UTF-8"%>

<%@attribute name="title"%>
<%@attribute name="nav"%>
<%@attribute name="subnav"%>
<%@attribute name="body_area" fragment="true" %>

<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href='<c:url value="/img/favicon.ico"/>'>

    <title>${title}</title>

    <!-- Bootstrap core CSS -->
    <link href='<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>' rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href='<c:url value="/resources/css/style.css"/>' rel="stylesheet">
    <link href='<c:url value="/resources/css/dashboard.css"/>' rel="stylesheet">
    <link href='<c:url value="/resources/css/jumbotron.css"/>' rel="stylesheet">
    <link href='<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css"/>' rel="stylesheet">

  </head>

  <body>

   <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div id="cnam-logo-header"></div>
          <a class="navbar-brand titresite" href='<c:url value="/vues/index.jsp"/>'>NSY135</a>
        </div><!-- /.nav-header -->
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li id="mediatheque" <c:if test="${nav.equals('mediatheque')}">class="active"</c:if> ><a href='<c:url value="/vues/index.jsp"/>'>Médiathèque</a></li>
            <li id="contact"   <c:if test="${nav.equals('contact')}">class="active"</c:if>><a href='<c:url value="/vues/contact.jsp"/>'>Contact</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->

	<div class="container-fluid">
	  <div class="row">
	    
		<t:nav_mediatheque></t:nav_mediatheque>

	    
	    <jsp:invoke fragment="body_area"/>
	    
	    </div><!-- /row -->
	</div><!-- /container-fluid -->

    <span id="top-link-block" class="hidden">
        <a href="#top" class="well well-sm"  onclick="$('html,body').animate({scrollTop:0},'slow');return false;">
            <i class="glyphicon glyphicon-chevron-up"></i> Back to Top
        </a>
    </span><!-- /top-link-block -->

    <footer class="footer bs-docs-footer"role="content-info">
      <p>Copyright &copy; 2016 Jonathan de Flaugergues for CNAM. All rights Reserved</p>
      <p>Designed by <a href="http://getbootstrap.com/" target="_blank">Bootstrap</a></p>
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src='<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>'></script>
    <script src='<c:url value="/resources/js/specific.js"/>'></script>
  </body>
</html>