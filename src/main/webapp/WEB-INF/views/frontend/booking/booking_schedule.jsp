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
        <div class="d-flex flex-column mx-auto" style="height: 800px; width:800px;">
            <h4 class="mt-5 fw-bold"> 2.選擇車次</h4>

            <div class="mx-auto border-1 border shadow mt-4" style="background-color: #fefefe; height: 550px; width: 550px;">
                
<div style="padding:15px;">
                    <table class="table table-striped border">
                       <thead>
                    <tr>
                        <th scope="col">車號</th>
                        <th scope="col">出發站</th>
                        <th scope="col">到達站</th>                       
                        <th scope="col">出發時間</th>
                        <th scope="col">到達時間</th>
                    </tr>
                </thead>
	                <tbody>
	                	<c:forEach items="${ schedule }" var="schedule">
	                		<tr>
		                		<td>${ schedule.trainNo }</td>
		                		<td>${ schedule.departStation }</td>
		                		<td>${ schedule.arriveStation }</td>		                		
		                		<td>${ schedule.departTime }</td>
		                		<td>${ schedule.arriveTime }</td>
	                		</tr>
	                	</c:forEach>
	                </tbody>
                </table>

            </div>

                <div class="d-flex justify-content-center align-items-center col-12">
                    <a href="booking_confirm.html" class="btn btn-primary w-50 mt-2 p-3" type="submit" id="queryBtn">確認車次</a>
                </div>

            </div>

        </div>
    </div>

   

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
