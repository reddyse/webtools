<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
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
  <script type="text/javascript">
  var myApp = {};
  myApp.myDate = "";

  document.getElementById('end').onclick = function (e) {
      if (this.value != myApp.myDate) {
          // run onchange code

          // then set last value to current value
          myApp.myDate = this.value;
          alert(myApp.myDate);
      }
  };
  
  /* $('#end').change(
  function calculateDays(){
	  
	  alert($('#start').val());
	  var date1 = new Date();
	  var date2 = new Date("8/11/2010");
	  var diffDays = parseInt((date2 - date1) / (1000 * 60 * 60 * 24)); 

	  alert(diffDays )
  }
  ); */
  </script>
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
      <a class="navbar-brand" href="home">MyTravelApp</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="home">${sessionScope.UserName}</a></li>
       </ul>
      <ul class="nav navbar-nav navbar-right">
       				<li><a href="logout" >Logout</a></li>
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
		
		<h1 class="text-center">Travel plan for ${cityName}</h3>
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
				<form class="form-inline" action="customplan" >
				<div class="form-group col-lg-6">
					<label>Start Date</label>
				    <input type="date" class="form-control" id="start" name="start" placeholder="Start Date">
				</div>
				
				<div class="form-group col-lg-6">
					<label>End Date</label>
				    <input type="date" class="form-control" id="end"  name="end" placeholder="End Date">
				</div>
				<input type="hidden" name="cityName" value=${cityName} />
                <div class="form-group col-lg-6">				<label for="sel2">Trip type (select one):</label>
	      <select class="form-control" id="sel2" name="selTripType">
	        <option value ="Solo">Solo</option>
	        <option value ="Family">Family</option>
	        <option value = "Friends">Friends</option>
	       </select>
					
				</div> 
				<div class="row">
			  <div class="col-lg-12">
				&nbsp;
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->               
				<button type="submit" class="btn btn-success btn-block">Register</button>
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
				
				<div class="row">
				  <div class="col-lg-12">
					&nbsp;
				  </div><!-- /.col-lg-6 -->
				</div>
				<%--<a href="customplan?cityName=${cityName}" class="btn btn-success btn-block">Register</a> --%>
			  
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