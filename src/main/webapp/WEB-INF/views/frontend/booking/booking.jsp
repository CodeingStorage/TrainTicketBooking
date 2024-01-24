<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>預訂車票</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>

<body>
  <%@ include file="../header.jsp" %>

  <div class="vh-100">

    <div class="d-flex flex-column mx-auto" style="height:800px;width:1000px">

      <h4 class="mt-3 p-md-3 fw-bold">預訂車票</h4>
      
        <div class="mx-auto border-1 border shadow mt-3">
          
          <form method="post" 
                action="/TrainTicketBooking/mvc/ticket/booking_schedule" 
                class="row g-3 needs-validation p-md-2" 
                style="background-color: rgb(255, 255, 255);" 
                novalidate>
            <div class="col-md-3">
              <label for="departStation" class="form-label">出發站</label>
              <select class="form-select" id="departStation" name="departStation" required>
                <option selected disabled value="">請選擇出發站</option>
                <option value="南港">南港</option>
                <option value="台北">台北</option>
                <option value="板橋">板橋</option>
                <option value="桃園">桃園</option>
                <option value="新竹">新竹</option>
                <option value="苗栗">苗栗</option>
                <option value="台中">台中</option>
                <option value="彰化">彰化</option>
                <option value="雲林">雲林</option>
                <option value="嘉義">嘉義</option>
                <option value="台南">台南</option>
                <option value="左營">左營</option>
                

              </select>
              <div class="invalid-feedback">
                請選擇出發站
              </div>
            </div>
            <div class="col-md-3">
              <label for="arriveStation" class="form-label">抵達站</label>
              <select class="form-select" id="arriveStation" name="arriveStation" required>
                <option selected disabled value="">請選擇抵達站</option>
                <option value="南港">南港</option>
                <option value="台北">台北</option>
                <option value="板橋">板橋</option>
                <option value="桃園">桃園</option>
                <option value="新竹">新竹</option>
                <option value="苗栗">苗栗</option>
                <option value="台中">台中</option>
                <option value="彰化">彰化</option>
                <option value="雲林">雲林</option>
                <option value="嘉義">嘉義</option>
                <option value="台南">台南</option>
                <option value="左營">左營</option>
              </select>
              <div class="invalid-feedback">
                請選擇抵達站
              </div>
            </div>
            <div class="col-md-3">
              <label for="departDate" class="d-block">出發日期</label>
              <input class="mt-2" 
                     type="date" 
                     id="departDate" name="departDate" 
                     style="width: 233px; height: 37px;" required />
              <div class="invalid-feedback">
                請選擇日期
              </div>
            </div>
            <div class="mt-3 col-3">
              <h5 class="d-flex justify-content-center">出發時間</h5>
              <input class="m-1 p-1 border rounded justify-content-center col-11" 
                     type="time" 
                     id="departTime" 
                     name="departTime" 
                      required/>
              <div class="invalid-feedback">
                請選擇時間
              </div>
            </div>
            <div class="col-md-3"></div>
            <div class="col-md-1"></div>
            <div class="col-7"></div>
            <div class="col-8"></div>
           	<div class=" col-4">
              <div class="p-3 m-1 d-flex ">
              <%--   <img src="./img/captcha.jpg" alt="驗證碼" class="me-2">
                <input type="text" class="form-control" id="captcha" name="captcha" required>
                <i class="bi bi-arrow-repeat fs-2 ms-2"></i> --%> 
              </div>
            </div>
            <div class="d-flex justify-content-center align-items-center col-12">              
              <button class="btn btn-primary w-25 p-3" type="submit" id="queryBtn">開始查詢</button>
            </div>
          </form>
        </div>
      </div>
    </div>
</body>
<footer>
  <div class="text-center position-relative start-50 translate-middle-x" id="footer">
    <p class="p-1 mb-0">&copy; 2023 Your Website. All rights reserved.</p>
  </div>
</footer>

</html>

<style>
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
<script>
  (function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
          console.log(form.checkValidity());
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
          form.classList.add('was-validated')
        }, false)
      })
  })()
  
   // 获取当前日期
    const currentDate = new Date().toISOString().split('T')[0];

    // 获取日期输入框元素
    const dateInput = document.getElementById('departDate');

    // 设置日期输入框的最小值为当前日期
    dateInput.setAttribute('min', currentDate);
  
</script>