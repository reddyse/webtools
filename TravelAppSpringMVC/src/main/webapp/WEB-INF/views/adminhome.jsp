<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.neu.myapp.fbsocial.FBConnection"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="stylesheet"></link>
  <link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet"></link>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
 <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
  <script>
  $(document).ready(function() {
	    $('#example').DataTable();
	} );
  </script>
  <style>
#autobox {
    display: block; 
    position:relative
} 
.ui-autocomplete {
    position: absolute;
}
</style>
</head>
<body>
<c:set var="userSession" value="${sessionScope.user}" />
	<%-- <c:choose>
	<c:when test="${not empty userSession}"> --%>
	<jsp:scriptlet>FBConnection fbConnection = new FBConnection();</jsp:scriptlet>
	<div id="fb-root"></div>
	<script>
		window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '1524813154490050', // App ID
		      status     : true, // check login status
		      cookie     : true, // enable cookies to allow the server to access the session
		      oauth      : true, // enable OAuth 2.0
		      xfbml      : true  // parse XFBML
		    });

		    // Additional initialization code here
		  };

		  // Load the SDK Asynchronously
		  (function(d){
		     var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
		     js = d.createElement('script'); js.id = id; js.async = true;
		     js.src = "http://connect.facebook.net/en_US/all.js";
		     d.getElementsByTagName('head')[0].appendChild(js);
		   }(document));
		  
		  function deleteUser(UserId,Status){
				alert('Delete user- '+UserId);
		    	 jQuery.ajax({
					  type: "POST",
					  dataType: "html",
					  url: "deleteuser?${_csrf.parameterName}=${_csrf.token}",
					  data: "userId="+UserId+"&status="+Status,
					  success: function(msg){
							if(msg === "success"){
								var row = document.getElementById(UserId);
		                        //row.parentNode.removeChild(row);
		                        if(Status =='1'){
		                        	alert('status1');
		                        	$( "#activateBtn_"+UserId ).prop( "disabled", false );
									$( "#disableBtn_"+UserId ).prop( "disabled", true );
		                        }else{
		                        	$( "#activateBtn_"+UserId ).prop( "disabled", true );
									$( "#disableBtn_"+UserId ).prop( "disabled", false );
		                        }
								
							}else{
								 alert("Deleting user failed");
								}
					  },
					  error: function(XMLHttpRequest, textStatus, errorThrown) {
					     alert("error deleting doctor");
					  }
					});
		    	 
		         }
	</script>
	
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="home">MyTravelApp</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="home">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Profile <span class="caret"></span></a>
        </li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <!--  <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>-->
				<li><a href="<%=fbConnection.getFBAuthUrl()%>"><img class="img-circle" src="${profile}" height="27"></a></li>
				<li><a href="<%=fbConnection.getFBAuthUrl()%>">${name}</a></li>
				<li><a href="logout" onclick="noBack();" >Logout</a></li>
        </li>
  </ul>
    </div>
  </div>
</nav>
  
<div class="container">
	<div class="row">
		<div class="col-md-2 col-lg-2">
		&nbsp;
		</div>
		<div class="col-md-8 col-lg-8">
		<h1 class="text-center">Welcome admin Praneeth</h3>
			<div class="row">
			  <div class="col-lg-12">
				&nbsp;
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			<div class="row">
			  <div class="col-lg-12">
				&nbsp;
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
		<div class="row">
		<div class="col-lg-12">
		<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
        	<tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email Address</th>
                <th>username</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        
        <tbody>
        	<c:forEach var="user" items="${userslist}">
				<tr id='${user.personID }'>
					<td>${user.firstName}</td>
					<td>${user.lastName}</td>
					<td>${user.email}</td>
					<td>${user.username} <input type="hidden" id="status_${user.personID}" value='${user.isDisabled}' /></td>
					<c:set var="status"  value="${user.isDisabled}"/>
					<c:if test="${status == 0}">
					   <td><button id="disableBtn_${user.personID}" type="button" class="btn btn-danger btn-xs" onClick="deleteUser('${user.personID}','1')" >Disable</button></td>
					   <td><button id="activateBtn_${user.personID}" type="button" class="btn btn-success btn-xs" onClick="deleteUser('${user.personID}','0')" disabled>Activate</button></td>
					</c:if>
					<c:if test="${status == 1}">
					   <td><button id="disableBtn_${user.personID}" type="button" class="btn btn-danger btn-xs" onClick="deleteUser('${user.personID}','1')" disabled>Disable</button></td>
					   <td><button id="activateBtn_${user.personID}" type="button" class="btn btn-success btn-xs" onClick="deleteUser('${user.personID}','0')" >Activate</button></td>
					</c:if>
				</tr>
			</c:forEach>
        </tbody>
        
    </table>
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			<div class="row">
			  <div class="col-lg-12">
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			<div class="row">
			  <div class="col-lg-12">
				&nbsp;
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
		</div>
		<div class="col-md-2 col-lg-2">
		&nbsp;
		</div>
	</div>
	<div class="row">
		<div class="col-md-2 col-lg-2">
		&nbsp;
		</div>
		<div class="col-md-8 col-lg-8">
		&nbsp;
		</div>
		<div class="col-md-2 col-lg-2">
		&nbsp;
		</div>
	</div>
  
</div>
    <div>
    	&nbsp;
    </div>
 <!-- Footer -->   
 <nav class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="container-fluid">
    Footer
  </div>
</nav>
</body>
</html>