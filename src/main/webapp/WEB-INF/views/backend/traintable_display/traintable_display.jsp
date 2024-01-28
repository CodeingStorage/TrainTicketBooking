<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>火車時刻表 修改/新增</title>
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
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
  
	<script type="text/javascript">
				function cancelschedule(trainNo) {
					var result = confirm("確定刪除" + trainNo + "車次?");
					if (result) {
						window.location.href='./traintable_display/';
					} else {
					}
					
			}
				</script>

</head>

<body>
 <%@ include file="../backend_header.jsp" %>

  <h2 class="m-3 pt-2">火車時刻表查詢/修改</h2>
  
  <form method="post" 
                action="${pageContext.request.contextPath}/mvc/ticket/backend/traintable_display" 
                class="row g-3 needs-validation p-md-2" 
                style="background-color: rgb(255, 255, 255);" 
                novalidate
                >
                <div class="col-md-2">
                        <label for="trainNo" class="form-label">輸入車次</label>
                        <input type="text" class="form-control" id="trainNo" name="trainNo" required>
                    </div>
            <div class="col-md-2">
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
            <div class="col-md-2">
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
            <div class="mt-3 col-2">
              <h5 class="d-flex justify-content-center">出發時間</h5>
              <input class="m-1 p-1 border rounded justify-content-center col-11" 
                     type="time" 
                     id="departTime" 
                     name="departTime" 
                      required/>
              <div class="invalid-feedback">
                請選擇出發時間
              </div>
            </div>
            <div class="mt-3 col-2">
              <h5 class="d-flex justify-content-center">抵達時間</h5>
              <input class="m-1 p-1 border rounded justify-content-center col-11" 
                     type="time" 
                     id="arriveTime" 
                     name="arriveTime" 
                      required/>
              <div class="invalid-feedback">
                請選擇抵達時間
              </div>
            </div>
            <div class="col-md-3"></div>
            <div class="col-md-1"></div>
            <div class="col-7"></div>
            <div class="col-8"></div>
           	<div class=" col-4">
              <div class="p-3 m-1 d-flex ">
              
              </div>
            </div>
            <div class="d-flex justify-content-center align-items-center col-12">              
              <button class="btn btn-primary w-25 p-3" type="submit" id="queryBtn">新增車次</button>
            </div>
          </form>
  
  
  <div style="padding: 20px;">
    <table id="myTable" class="table table-bordered table-striped table-hover">
      <thead>
                    <tr>
                        <th>車次</th>
                        <th>出發站點</th>
                        <th>抵達站點</th>
                        <th>出發時間</th>
                        <th>抵達時間</th>                       
                        <th>操作</th> <!-- 修改 Actions 列為操作 -->
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${ schedule }" var="schedule">                     
                        <tr>
                            <td>${schedule.trainNo}</td>
                            <td>${schedule.departStation}</td>
                            <td>${schedule.arriveStation}</td>
                            <td>${schedule.departTime}</td>
                            <td>${schedule.arriveTime}</td>
                            <td>
                                <!-- 使用 Bootstrap 按鈕樣式 -->
                                
                                <button type="button"  onClick="cancelschedule(${ schedule.trainNo })" class="btn btn-primary" id="deleteBtn">刪除</button>
                                <button type="button"  onclick="location.href='./traintable_display_update?trainNo=${schedule.trainNo}'" class="btn btn-primary" id="updateBtn">修改</button>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
         </table>       
  </div>
  
</body>

</html>
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
  
  $(document).ready(function () {
    // 監聽出發時間的變化
    $('#departTime').on('input', function () {
      // 獲取出發時間的值
      var departTimeValue = $(this).val();

      // 將抵達時間的最小值設為出發時間
      $('#arriveTime').attr('min', departTimeValue);

      // 清空抵達時間的值，以便用戶重新選擇
      $('#arriveTime').val('');
    });
  });
  
  //車號重複-------------------------------------------------------------------------------
  $(document).ready(function () {
      $("#trainNo").blur(function () {
          var trainNo = $(this).val();
          if (trainNo.trim() !== "") {
              // 使用Ajax發送請求到後端檢查是否重複
              $.ajax({
                  type: "GET",
                  url: "/backend/checkTrainNo",  // 將此URL替換為實際的後端檢查車號的端點
                  data: { trainNo: trainNo },
                  success: function (response) {
                      if (response === "duplicate") {
                          alert("車號重複，請輸入其他車號");
                          $("#trainNo").val("");  // 清空輸入
                      }
                  },
                  error: function (xhr, status, error) {
                      console.error("發生錯誤：" + error);
                  }
              });
          }
      });
  });
  //前往修改頁面
  function showUpdateForm(trainNo) {
      
      var targetUrl = "${pageContext.request.contextPath}/mvc/ticket/backend/traintable_display_update";
      
      // 進行轉跳
      window.location.href = targetUrl;
  }
  
</script>