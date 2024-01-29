<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查詢/修改車票</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>

<body>

  <%@ include file="../header.jsp" %>
  
    <div class="vh-100">
        <div class="d-flex flex-column mx-auto" style="height: 500px;width:800px">
            <h4 class="mt-5 fw-bold">訂位紀錄查詢</h4>
            <div class="mx-auto border-1 border shadow mt-4" style="height: 500px;width:800px">
                <form class="row g-3 needs-validation p-4 method="get" action="./ticket_query_present">
                    <div class="mb-3 col-12">
                        <label for="userId" class="form-label">身分證字號</label>
                        <input type="text" class="form-control" id="userId" name="userId" required>
                    </div>
                    <div class="mb-3 col-12">
                        <label for="ticketId" class="form-label">車票號碼</label>
                        <input type="text" class="form-control" id="ticketId" name="ticketId" required>
                    </div>
                    <div class="mb-3 col-12">
                       <%--  <div class="d-flex w-50">
                            <img src="/ticket_query/captcha.jpg" alt="驗證碼" class="me-2">
                            <input type="text" class="form-control" id="captcha" name="captcha">
                            <i class="bi bi-arrow-repeat fs-2 ms-2"></i>
                        </div>--%>
                    </div>
                    <div class="mb-3 col-12">
                         <button class="btn btn-primary w-100" type="submit" id="queryBtn">查詢</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</body>
<footer>
    <div class="text-center position-relative  start-50 translate-middle-x" id="footer">
        <p class="p-1 mb-0">&copy; 2023 Your Website. All rights reserved.</p>
    </div>
</footer>

</html>



<style>

    #queryBtn {
        background-color: #db5009 !important;
        border: none;
    }

    #queryBtn:hover {
        background-color: #e5680a !important;
    }

    footer {
      background-color: #db5009 !important;
      border: none;
    }

</style>

    <script>
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