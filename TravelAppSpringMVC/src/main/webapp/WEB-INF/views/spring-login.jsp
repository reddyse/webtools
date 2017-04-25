<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body onload='document.loginForm.username.focus();'>

	<div class="container">

      	<div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>

		<div class="form-group" role="form">

            <p></p>
            <div class="col-md-3">
            </div>
			<div class="panel-group col-md-6">
				<div class="panel panel-info">
                	<h1>
			<center><span style="font-family:'Open Sans', Arial; font-weight:bold; font-size:40px">
                    <font color="#4285F4">Tr</font><font color="#FCBD05">avel</font><font color="#EB584C">Lophilia</font></span></center>
			</h1>
                    <div class="panel-heading">
                    	<center>SECURED LOGIN</center>
					</div>
					<div class="panel-body">

						<!-- Login Box-->
						
						<div id="patientForm" class="row">
						 <form name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>
							<div class="row">
							<div class="col-md-2"></div>
                            <div class="col-md-8">
                            	<c:if test="${not empty error}">
                            		<div class="alert alert-danger alert-dismissable">
                            		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  										<strong>Error!</strong> ${error}.
									</div>
								</c:if>
								<c:if test="${not empty msg}">
									<div class="alert alert-success alert-dismissable">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  										<strong>Info!</strong> ${msg}.
									</div>
								</c:if>
                            </div>
                            <div class="col-md-2">
                            </div>
                            </div>
                            
							<div class="row">
                            <div class="col-md-2">
                            </div>
							<div class="form-group col-md-8">
								<label for="patientName">Name:</label> <input name="username"
									type="text" class="form-control" placeholder="Enter Secured Username">
							</div>
                            <div class="col-md-2">
                            </div>
                            </div>
                            

                            
                            <div class="row">
                            <div class="col-md-2">
                            </div>
							<div class="form-group col-md-8">
								<label for="location">Password:</label> <input name="password"
									type="password" class="form-control" placeholder="Enter Password">
							</div>
                            <div class="col-md-2">
                            </div>
                            </div>
                                                        
							
                            <div class="row">
                            <div class="col-md-5">
                            </div>
							<div class="form-group">
								<input type="submit" class="btn btn-success" value="LOGIN">
							</div>

                            </div>
                            <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />						
                        </form>
						</div>
						
						<!-- End: Login Box -->
                        
						
					</div>

				</div>

			</div>           
		</div>
	</div>

</body>
</html>