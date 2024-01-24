<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>列車時刻/車次查詢</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

</head>


<%@ include file="../header.jsp" %>

<div class="vh-100">
    <div class="d-flex flex-column mx-auto mt-5">
        <h4 class="fw-bold mx-auto mt-5">列車時刻/車次查詢</h4>
        <div class="" style="background-color: #F9F9F9 !important;height: 200px;">
            <div class="mx-auto mt-3 w-75 h-75" style="background-color: rgb(255, 255, 255);">
                <form method="post" action="/TrainTicketBooking/mvc/ticket/schedule_query_present" class="row gx-3 d-flex justify-content-center align-items-center border shadow">
                    <div class="form-group mt-3 col-2">
                        <label for="departStation" class="d-flex justify-content-center">出發站</label>
                        <select class="form-select" id="departStation" name="departStation">
                            <option selected value="1">南港</option>
                            <option value="2">站點二</option>
                            <option value="3">站點三</option>
                            <option value="4">站點四</option>
                            <option value="5">站點四</option>
                        </select>
                    </div>
                    <div class="mt-3 col-2">
                        <label for="arriveStation" class="d-flex justify-content-center">抵達站</label>
                        <select class="form-select" id="arriveStation" name="arriveStation">
                            <option selected value="5">高雄</option>
                            <option value="4">站點四</option>
                            <option value="3">站點三</option>
                            <option value="2">站點二</option>
                            <option value="1">站點一</option>
                        </select>
                    </div>
                    
                    
                    

                    <div class="d-flex justify-content-center align-items-center col-12">
                        <button class="btn btn-primary w-50 m-2" type="submit" id="queryBtn">開始查詢</button>
                    </div>
                </form>
            </div>
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

    #footer {
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