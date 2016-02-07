<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:simple_layout title="Accueil" nav="mediatheque">
	<jsp:attribute name="body_area">

	    <!-- Column Right-->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

          <!-- Main jumbotron for a primary marketing message or call to action -->
          <div class="jumbotron">
            <div class="container">
              <h1>CNAM Médiathèque</h1>
              <p>Consultez et empruntez des documents (DVD, Périodique, Livre).</p>
            </div>
          </div>


          <div class="content"> 
            <div class="container">

              <div class="row">
                <div class="col-sm-6 col-md-6">
                  <div class="thumbnail">
                    <div class="centeredSection fa-thumbnails"><i class="fa fa-list fa-5x"></i></div>
                    <div class="caption">
                      <h3>1) Tous les documents</h3>
                      <p></p>
                      <p><a href="<c:url value="/mediatheque"><c:param name="action" value="list"/></c:url>" 
                      	    class="btn btn-primary centeredSection" role="button">Accéder</a>
                      </p>
                    </div>
                  </div>
                </div>
                <div class="col-sm-6 col-md-6">
                  <div class="thumbnail">
                    <div class="centeredSection fa-thumbnails"><i class="fa fa-clock-o fa-5x"></i></div>
                    <div class="caption">
                      <h3>2) Documents en retard</h3>
                      <p></p>
                      <p><a href="<c:url value="/mediatheque"><c:param name="action" value="delay"/></c:url>" 
                      	    class="btn btn-primary centeredSection" role="button">Accéder</a>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div> <!-- /container -->
          </div> <!-- /content -->


        </div><!-- Column Right-->

	</jsp:attribute>
</t:simple_layout>

<script>$('#index').attr('class','active');</script>