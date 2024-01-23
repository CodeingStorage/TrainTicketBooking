<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="/TrainTicketBooking/mvc/ticket/frontend/main">灣鐵</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active " aria-current="page" href="/TrainTicketBooking/mvc/ticket/schedule_query">列車時刻/車次查詢</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active " aria-current="page" href="/TrainTicketBooking/mvc/ticket/booking">預訂車票</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active " aria-current="page" href="/TrainTicketBooking/mvc/ticket/ticket_query">查詢/修改車票</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active " aria-current="page" href="/TrainTicketBooking/mvc/ticket/backend/traintable_display">後端</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>