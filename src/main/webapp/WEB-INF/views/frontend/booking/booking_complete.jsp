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
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="../index.html">灣鐵</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                  <a class="nav-link active " aria-current="page" href="../schedule_query/schedule_query.html">列車時刻/車次查詢</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link active " aria-current="page" href="booking.html">預訂車票</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link active " aria-current="page" href="../ticket_query/ticket_query.html">查詢/修改車票</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link active " aria-current="page" href="../../backend//ticket_info/ticket_info_display.html">後端</a>
              </li>
          </ul>
          </div>
        </div>
      </nav>

    <div class="vh-100">
        <div class="d-flex flex-column mx-auto" style="height:1000px;width:1000px">
            <h4 class="m-5 fw-bold">訂票完成!</h4>
            <div class="mx-auto border-1 border shadow d-flex justify-content-evenly" style="height:400px;width:900px">
                

            </div>



        </div>




    </div>


</body>

</html>