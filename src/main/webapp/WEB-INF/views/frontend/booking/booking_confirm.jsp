<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>取票資訊</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>

<body>

    <%@ include file="../header.jsp" %>

    <div class="">

        
        <div class="d-flex flex-column mx-auto" style="height:800px;width:1000px">
            <h4 class="mt-0 mx-5 px-1 fw-bold">取票人資訊</h4>
            <div class="mx-auto border-1 border shadow" style="height:400px;width:900px">
                <form class="row g-3 needs-validation p-4">
                    <div class="mb-3 col-4">


                        <label for="inputState" class="form-label mt-3">取票識別碼</label>
                        <select id="inputState" class="form-select">
                            <option selected>身分證字號</option>
                            <option>護照/居留證/入出境許可證號碼</option>
                        </select>
                    </div>
                    <div class="mb-3 col-8">
                        <label for="userId" class="form-label mt-3">輸入識別碼</label>
                        <input type="text" class="form-control" id="userId" name="userId" required>
                    </div>

                    <div class="mb-3 col-6">
                        <label for="ticketNo" class="form-label">連絡電話</label>
                        <input type="text" class="form-control" id="ticketNo" name="ticketNo" required>
                    </div>
                    <div class="mb-3 col-6">
                        <label for="ticketNo" class="form-label">電子郵件</label>
                        <input type="text" class="form-control" id="ticketNo" name="ticketNo" required>
                    </div>

                    <div class="d-flex justify-content-center align-items-center col-12">
                        <a href="booking_complete.html" class="btn btn-primary w-50 mt-5 p-3" type="submit"
                            id="queryBtn">完成訂票</a>
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