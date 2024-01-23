<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>灣鐵網路訂票</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>

<body>

   <%@ include file="../header.jsp" %>
   
    <div class="vh-100">
        <div class="d-flex flex-column mx-auto" style=" height: 800px;width:800px ">
            <h4 class="mt-5 fw-bold"> 2.選擇車次</h4>

            <div class="mx-auto border-1 border shadow mt-4" style="background-color: #fefefe;height:550px;width:550px">
                <h5 class="m-3 fw-bold">站點A-站點B</h5>
                <h6 class="m-3">日期:20xx/xx月/xx日</h6>


                <div class="form-check m-2 ">
                    <input class="form-check-input mt-3" type="radio" name="flexRadioDefault" id="flexRadioDefault1"
                        checked>
                    <label class="form-check-label" for="flexRadioDefault1">
                        <li class="list-group-item shadow-sm p-3 mb-2 bg-body rounded" id="bar">9:00~10:00</li>
                    </label>
                </div>

                <div class="form-check m-2">
                    <input class="form-check-input mt-3" type="radio" name="flexRadioDefault" id="flexRadioDefault2"
                        checked>
                    <label class="form-check-label" for="flexRadioDefault2">
                        <li class="list-group-item shadow-sm p-3 mb-2 bg-body rounded" id="bar">10:00~11:00 </li>
                    </label>
                </div>

                <div class="form-check m-2">
                    <input class="form-check-input mt-3" type="radio" name="flexRadioDefault" id="flexRadioDefault3"
                        checked>
                    <label class="form-check-label" for="flexRadioDefault3">
                        <li class="list-group-item shadow-sm p-3 mb-2 bg-body rounded" id="bar">11:00~12:00</li>
                    </label>
                </div>

                <div class="form-check m-2">
                    <input class="form-check-input mt-3" type="radio" name="flexRadioDefault" id="flexRadioDefault4"
                        checked>
                    <label class="form-check-label" for="flexRadioDefault4">
                        <li class="list-group-item shadow-sm p-3 mb-2 bg-body rounded" id="bar">12:00~13:00</li>
                    </label>
                </div>

                <div class="form-check m-2">
                    <input class="form-check-input mt-3" type="radio" name="flexRadioDefault" id="flexRadioDefault5"
                        checked>
                    <label class="form-check-label" for="flexRadioDefault5">
                        <li class="list-group-item shadow-sm p-3 mb-2 bg-body rounded" id="bar">11:00~12:00</li>
                    </label>
                </div>

                <div class="d-flex justify-content-center align-items-center col-12">
                    <a href="booking_confirm.html" class="btn btn-primary w-50 mt-2 p-3" type="submit"
                        id="queryBtn">確認車次</a>
                </div>

            </div>

        </div>
    </div>





<footer>
    <div class="text-center position-relative  start-50 translate-middle-x" id="footer">
        <p class="p-1 mb-0">&copy; 2023 Your Website. All rights reserved.</p>
    </div>
</footer>

</body>



</html>

<style>
    #bar{
        width: 450px;
        background-color: #fff;

    }

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