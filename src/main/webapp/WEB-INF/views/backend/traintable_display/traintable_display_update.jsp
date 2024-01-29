<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>
<body>

<form method="post" action="${pageContext.request.contextPath}/mvc/ticket/backend/traintable_display_update/update"
      class="row g-3 needs-validation p-md-2" style="background-color: rgb(255, 255, 255);" novalidate>
    <!-- 這裡添加輸入欄位，注意名稱要和 Controller 中的 @RequestParam 一致 -->
    <div class="col-md-2 mt-5">
        <label for="updateTrainNo" class="form-label ms-4">車次</label>
         <input type="hidden" id="updateTrainNo" name="updateTrainNo" value="${schedule.trainNo}">
         ${schedule.trainNo}
    </div>
     <div class="col-md-2">
              <label for="updateDepartStation" class="form-label">出發站</label>
              <select class="form-select" id="updateDepartStation" name="updateDepartStation" required>
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
              <label for="updateArriveStation" class="form-label">抵達站</label>
              <select class="form-select" id="updateArriveStation" name="updateArriveStation" required>
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
                     id="updateDepartTime" 
                     name="updateDepartTime" 
                      required/>
              <div class="invalid-feedback">
                請選擇出發時間
              </div>
            </div>
            <div class="mt-3 col-2">
              <h5 class="d-flex justify-content-center">抵達時間</h5>
              <input class="m-1 p-1 border rounded justify-content-center col-11" 
                     type="time" 
                     id="updateArriveTime" 
                     name="updateArriveTime" 
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
              
            </div>

    <div class="col-12">
        <button class="btn btn-primary" type="submit">更新時刻表</button>
    </div>
</form>

</body>
</html>