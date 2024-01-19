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
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="ticket_info_display.html">灣鐵後端</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="./ticket_info_display.html">購票紀錄查詢</a>
          </li>
        
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="../traintable_display/traintable_display_northbound.html">火車時刻表查詢/修改</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="../../frontend/index.html">前端</a>
          </li>
       
        </ul>
        
      </div>
    </div>
  </nav>

    <h2 class="m-3 pt-2">購票紀錄</h2>
    <div style="padding: 20px;">
    <table id="myTable" class="table table-bordered table-striped table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>訂位代號</th>
                <th>出發站</th>
                <th>抵達站</th>
                <th>出發日期</th>
                <th>出發時間</th>
                <th>票種</th>
                <th>數量</th>
                <th>價格</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>A123456789</td>
                <td>12345678</td>
                <td>台北</td>
                <td>台中</td>
                <td>2008-10-16</td>
                <td>10:00</td>
                <td>全票</td>
                <td>1</td>
                <td>150元</td>
            </tr>
            <tr>
                <td>A98765432</td>
                <td>98765432</td>
                <td>台北</td>
                <td>台中</td>
                <td>2051-10-16</td>
                <td>10:00</td>
                <td>全票</td>
                <td>1</td>
                <td>150元</td>
            </tr>
            <!--<tr th:each="score, state : ${ scores }">
                <td>0</td>
                <td th:text="${ticket.id}"></td>
                <td th:text="${score.name}"></td>
                <td th:text="${score.chineseScore}"></td>
                <td th:text="${score.englishScore}"></td>
                <td th:text="${score.mathScore}"></td>
                <td th:text="${score.totalScore}"></td>
                <td th:text="${#numbers.formatDecimal(score.averageScore, 1, 1)}"></td>
            </tr>-->
        </tbody>
    </table>
</div>
</body>

</html>