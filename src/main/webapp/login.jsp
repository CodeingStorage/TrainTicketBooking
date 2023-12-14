<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta charset="UTF-8">
		<title>Ticket Login Page</title>
		<link rel="shortcut icon" type="image/x-icon" href="./images/icon.png">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	    
	    <style >
	    	 body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: auto;
            margin-top: 250px;
            
        }
	    
	    </style>

</head>
<body>
	<div class="container login-container ">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title text-center">會員登入</h5>
            <form class="needs-validation" novalidate method="post" action="./login">
                <div class="form-group">
                    <label for="username">🍞帳號</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="請輸入帳號">
                </div>
                <div class="form-group">
                    <label for="password">⚡密碼</label>
                    <input type="password" class="form-control" id="password" name="password"  placeholder="請輸入密碼">
                </div>
                <button type="submit" class="btn btn-primary btn-block">前台燈入</button>
                <button type="submit" class="btn btn-primary btn-block">後台登入</button>
            </form>
        </div>
    </div>
</div>


</body>
</html>

<script type="text/javascript">
(function () {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }

	        form.classList.add('was-validated')
	      }, false)
	    })
	})()
</script>