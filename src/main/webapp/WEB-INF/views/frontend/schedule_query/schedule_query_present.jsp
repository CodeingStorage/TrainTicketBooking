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
   <%@ include file="../header.jsp" %>

    <div class="vh-100">
        <div class="d-flex flex-column mx-auto" style=" height: 800px;width:1000px ">
            <div class="mx-auto border-1 border shadow mt-4"
                style="background-color: #fefefe;height:550px;width:1000px">
                <div class="row">
                    <div class="col">
                <h5 class="m-3 fw-bold">站點A-站點B</h5>
                </div>
                <div class="col">
                <h6 class="m-3">日期:20xx/xx月/xx日</h6>
                </div>
                
                </div>
                <div style="padding:15px;">
                    <table class="table table-striped border">

                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">出發時間</th>
                                <th scope="col">抵達時間</th>
                                <th scope="col">車次</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>9:00</td>
                                <td>10:00</td>
                                <td>0125</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>10:00</td>
                                <td>11:00</td>
                                <td>0125</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>9:00</td>
                                <td>10:00</td>
                                <td>0125</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>9:00</td>
                                <td>10:00</td>
                                <td>0125</td>
                            </tr>
                        </tbody>
                </div>
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