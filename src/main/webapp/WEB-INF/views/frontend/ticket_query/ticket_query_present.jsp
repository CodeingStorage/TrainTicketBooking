<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>車票搜尋結果</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
				function cancelticket(ticketId) {
					var result = confirm("確定刪除訂票？");
					if (result) {
						window.location.href='./ticket_query/cancel?ticketId=' + ticketId;
					} else {
					}
					
			}
				</script>
</head>

<body>

    <%@ include file="../header.jsp" %>
    <div class="vh-100">
    <div class="container mt-5">
        <h2 class="mb-4">查詢結果</h2>
    
        
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>車票ID</th>
                        <th>身分證字號</th>
                        <th>火車車次</th>
                        <th>出發站</th>
                        <th>抵達站</th>
                        <th>出發時間</th>
                        <th>抵達時間</th>                        
                        <th>價格</th>
                        <th>訂票時間</th>
                        <th>操作</th> <!-- 修改 Actions 列為操作 -->
                    </tr>
                </thead>
                <tbody>                     
                        <tr>
                            <td>${ticket.ticketId}</td>
                            <td>${ticket.userId}</td>
                            <td>${ticket.trainNo}</td>
                            <td>${ticket.schedule.departStation}</td>
                            <td>${ticket.schedule.arriveStation}</td>
                            <td>${ticket.schedule.departTime}</td>
                            <td>${ticket.schedule.arriveTime}</td>
                            <td>${ticket.price}</td>
                            <td>${ticket.bookTime}</td>
                            
                            
                            <td>
                                <!-- 使用 Bootstrap 按鈕樣式 -->
                                
                                <button type="button"  onClick="cancelticket(${ ticket.ticketId })" class="btn btn-primary" id="deleteBtn">刪除</button>
                            </td>
                        </tr>
                    
                </tbody>
            </table>
       
   				
        
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
    /* 自定義按鈕樣式，設置寬度和高度 */
   

    #deleteBtn {
        background-color: #9e9a98 !important;
        border: none;
    }

    #deleteBtn:hover {
        background-color: #db5009 !important;
    }

    #footer {
        background-color: #db5009 !important;
        border: none;
    }
</style>