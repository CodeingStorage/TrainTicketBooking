<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購票紀錄查詢(表單)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- 引入 DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <!-- 引入 jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- 引入 DataTables 創造出多種排序功能之表單-->
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.table').DataTable({
                //設定語言為繁體中文
                "language": {
                    "url": "/js/datatables_zh_tw.json"
                }                
            });
        });
    </script>

</head>

<body>
 <%@ include file="../backend_header.jsp" %>

    <h2 class="m-3 pt-2">購票紀錄</h2>
    <div style="padding: 20px;">
    <table id="myTable" class="table table-bordered table-striped table-hover">
      <thead>
                    <tr>
                        <th>車票Id</th>
                        <th>身分證字號</th>
                        <th>車次</th>
                        <th>乘車時間</th>
                        <th>出發站點</th>
                        <th>抵達站點</th>                       
                        <th>出發時間</th>                                             
                        <th>抵達時間</th>                       
                        <th>車廂</th>                       
                        <th>座位</th>                       
                        <th>價格</th>                       
                        <th>訂票時間</th>                       
                        <th>操作</th> <!-- 修改 Actions 列為操作 -->
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${ tickets }" var="tickets">                     
                        <tr>
                            <td>${tickets.ticketId}</td>
                            <td>${tickets.userId}</td>
                            <td>${tickets.schedule.trainNo}</td>                            
                            <td>${tickets.date}</td>                            
                            <td>${tickets.schedule.departStation}</td>
                            <td>${tickets.schedule.arriveStation}</td>
                            <td>${tickets.schedule.departTime}</td>                            
                            <td>${tickets.schedule.arriveTime}</td>                           
                            <td>${tickets.trainCarId}</td>
                            <td>${tickets.seatId}</td>
                            <td>${tickets.price}</td>
                            <td>${tickets.bookTime}</td>
                            <td>
                                <!-- 使用 Bootstrap 按鈕樣式 -->
                                
                                
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
         </table>       
</div>
</body>
<footer>
    <div class="text-center position-relative  start-50 translate-middle-x" id="footer">
        <p class="p-1 mb-0">&copy; 2023 Your Website. All rights reserved.</p>
    </div>
</footer>

</html>