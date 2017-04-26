<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">MyTravelApp</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Profile <span class="caret"></span></a>
        </li>
        <li><a href="#">About Us</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <!--  <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>-->
        <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
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
		&nbsp;
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
		<h1 class="text-center">Travel</h3>
			<div class="row">
			  <div class="col-lg-12">
				&nbsp;
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			<div class="row">
			  <div class="col-lg-12">
				&nbsp;
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row --><div class="row">
			  <div class="col-lg-12">
				&nbsp;
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			<div class="row">
			  <div class="col-lg-12">
				<form class="form-inline">
				<div class="form-group col-lg-6">
					<label>Start Date</label>
				    <input type="date" class="form-control" id="email" placeholder="Start Date">
				</div>
				
				<div class="form-group col-lg-6">
					<label>End Date</label>
				    <input type="date" class="form-control" id="email" placeholder="End Date">
				</div>
				
				
			    </form>
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			<div class="row">
			  <div class="col-lg-12">
				&nbsp;
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			<div class="row">
			  <div class="col-lg-12">
				<form class="form-inline">
				
				<div class="row">
					  <div class="col-lg-6">
					  
					    <div class="radio">
						  <label>Trip Type</label>
						</div>
						<div class="radio">
						  <label><input type="radio" name="optradio">Solo</label>
						</div>
						<div class="radio">
						  <label><input type="radio" name="optradio">Family</label>
						</div>
						<div class="radio disabled">
						  <label><input type="radio" name="optradio" >Friends</label>
						</div>
					  </div><!-- /.col-lg-6 -->
					
					  <div class="col-lg-6">
					  <div class="radio">
						  <label>Expenses</label>
						</div>
						<div class="radio">
						  <label><input type="radio" name="optradio">$</label>
						</div>
						<div class="radio">
						  <label><input type="radio" name="optradio">$$</label>
						</div>
						<div class="radio disabled">
						  <label><input type="radio" name="optradio" >$$$</label>
						</div>
					  </div><!-- /.col-lg-6 -->
				 </div><!-- /.row -->
				
				<div class="row">
				  <div class="col-lg-12">
					&nbsp;
				  </div><!-- /.col-lg-6 -->
				</div>
				<a href="register" class="btn btn-success btn-block">Register</a>
			  </form>
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
    
 <!-- Footer -->   
 <nav class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="container-fluid">
    Footer
  </div>
</nav>
</body>
</html>