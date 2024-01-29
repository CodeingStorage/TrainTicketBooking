<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

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
   <%@ include file="./header.jsp" %>
    <div class="vh-100">
        <div class="container d-flex justify-content-around pt-5">
            <div class="row justify-content-center mt-5">
                <a href="${pageContext.request.contextPath}/mvc/ticket/booking">
                    <button type="button" class="btn btn-primary custom-button" id="queryBtn"><h1>前往訂票</h1></button>
                </a>
            </div>

            <div class="row justify-content-center mt-5">
                <a href="${pageContext.request.contextPath}/mvc/ticket/ticket_query">
                    <button type="button" class="btn btn-primary custom-button" id="queryBtn"><h1>訂位查詢</h1></button>
                </a>
            </div>
        </div>


    </div>

</body>

<footer>
    <div class="text-center position-relative bottom-0 start-50 translate-middle-x w-100" id="footer">
        <p class="p-1 mb-0">&copy; 2023 Your Website. All rights reserved.</p>
    </div>
</footer>

</html>

<style>
    /* 自定義按鈕樣式，設置寬度和高度 */

    .custom-button {
        width: 500px;
        height: 200px;
        font-size: 24px;
        /* 可自行調整字體大小 */
    }

    #queryBtn {
        background-color: #9e9a98 !important;
        border: none;
    }

    #queryBtn:hover {
        background-color: #db5009 !important;
    }

    #footer {
        background-color: #db5009 !important;
        border: none;
    }
</style>