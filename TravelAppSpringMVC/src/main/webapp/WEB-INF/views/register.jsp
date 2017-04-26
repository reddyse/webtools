<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <title>Register User</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    
      
    </div>

  </div>
</nav>
    <div class="container">
        <h1>Register</h1>
        <form action="profile?${_csrf.parameterName}=${_csrf.token}" method="post" commandName="User">
            <div class="form-group">
                <input type="text" class="form-control" id="username" name="username" path="username" placeholder="User Name">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="password" name="password" path="password" placeholder="Password">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="password2"  placeholder="Confirm Password">
            </div>
             <div class="form-group">
                <input type="text" class="form-control" id="fname" name="firstName" path="firstName" placeholder="First Name">
            </div>
             <div class="form-group">
                <input type="text" class="form-control" id="lname" name="lastName" path="lastName" placeholder="Last Name">
            </div>
             <div class="form-group">
                <input type="text" class="form-control" id="email" name="email" path="email" placeholder="Email">
            </div>
             <div class="form-group">
                <input type="file" class="form-control" id="profilepic" name="profilePictureURI" path="profilePictureURI" placeholder="Profile Picture">
            </div>
            <input type="submit" name ="action"   value ="Register" class="btn btn-block btn-primary"/>
            <div class="form-group">
            </div>
            <div class="form-group">
                <a href="login" class="btn btn-block btn-danger">Cancel</a>
            </div>
        </form>
    </div>
        <!-- Footer -->   
 <nav class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="container-fluid">
    By Praneeth
  </div>
  </nav>
</body>
</html>