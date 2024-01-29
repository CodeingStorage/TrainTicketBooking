<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>車票訂購完成</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>

<body>
   <%@ include file="../header.jsp" %>
	
		
      <div class="vh-100">
        <div class="d-flex flex-column mx-auto" style="height:1000px;width:1000px">
            <h4 class="m-5 fw-bold">訂票完成!</h4>
            <div class="mx-auto border-1 border shadow d-flex justify-content-evenly" style="height:400px;width:900px">
    <table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">車票號碼</th>
      <th scope="col">身分證字號</th>
      <th scope="col">車次</th>
      <th scope="col">乘車日期</th>
      <th scope="col">車廂</th>
      <th scope="col">座位號碼</th>
      <th scope="col">價格</th>
      <th scope="col">訂票時間</th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td>${ticket.ticketId}</td>
        <td>${ticket.userId}</td>
        <td>${ticket.trainNo}</td>
        <td>${ticket.date}</td>
        <td>${ticket.trainCarId}</td>
        <td>${ticket.seatId}</td>
        <td>${ticket.price}</td>
        <td>${ticket.bookTime}</td>
  </tr>
  </tbody>
</table>
    
       
        
            
        
    

            </div>



        </div>




    </div>




</body>

</html>