<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>時刻表搜尋結果</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>

<body>
${ schedule }
   <%@ include file="../header.jsp" %>

    <div class="vh-100">
        <div class="d-flex flex-column mx-auto" style=" height: 800px;width:1000px ">
            <div class="mx-auto border-1 border shadow mt-4"
                style="background-color: #fefefe;height:550px;width:1000px">
                <div class="row">
                    <div class="col">
                
                </div>
                <div class="col">
               
                </div>
                
                </div>
                <div style="padding:15px;">
                    <table class="table table-striped border">

                       <thead>
                    <tr>
                        <th scope="col">車號</th>
                        <th scope="col">出發站</th>
                        <th scope="col">到達站</th>
                        <th scope="col">出發日期</th>
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
        </div>
    </div>
    </div>
</body>

</html>

<style>
    table {
        padding: 15px;
    }

    footer {
        background-color: #db5009 !important;
        border: none;
    }
</style>