<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/28/2021
  Time: 10:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns:https="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Chỉnh sửa sản phẩm</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</head>
<body>
<style>
  @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap");

  body {
    background-color: #eee;
    font-family: "Poppins", sans-serif;
    font-weight: 300
  }

  .height {
    height: 100vh
  }

  .card {
    width: 380px;
    border: none
  }

  .form-control {
    border: 2px solid #bdc1d2;
    font-size: 13px;
    height: 48px
  }

  .form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #f7bfd9;
    outline: 0;
    box-shadow: none
  }

  .form {
    position: relative;
    margin-bottom: 25px
  }

  .form textarea {
    height: 100px;
    resize: none
  }

  .form a {
    position: absolute;
    right: 8px;
    bottom: 10px;
    color: #6ca0d6;
    font-size: 13px;
    text-decoration: none;
    z-index: 10;
    background-color: #fff;
    padding: 5px
  }

  .fa-paperclip {
    font-size: 19px
  }

  .quote {
    font-size: 13px
  }

  .send {
    height: 46px;
    font-size: 14px
  }
</style>
<div class="container d-flex justify-content-center align-items-center height">
  <div class="card py-3">
    <form action="edit" method="post">
      <div class="p-3 d-flex align-items-center justify-content-center">
        <h5>Chỉnh sửa sản phẩm</h5>
      </div>
      <div class="p-3 px-4 py-2">
        <span class="form-group">Mã sản phẩm</span>
        <input value="${detail.id}" type="text" name="id" class="form-control mb-2" readonly required />
        <span class="form-group">Tên sản phẩm</span>
        <input value="${detail.name}" type="text" name="name" class="form-control mb-2" required />
        <span class="form-group">Hình ảnh</span>
        <input value="${detail.image}" type="text" name="image" class="form-control mb-2" required />
        <span class="form-group">Giá</span>
        <input value="${detail.price}" type="text" name="price" class="form-control mb-2" required/>
        <span class="form-group">Mô tả</span>
        <div class="form"> <textarea class="form-control mb-3 description-area" name="script" required>${detail.script}</textarea></div>
        <div class="form-group">
          <label>Danh mục</label>
          <select name="category" class="form-select" aria-label="Default select example">
            <c:forEach items="${listC}" var="o">
              <option value="${o.cID}">${o.cname}</option>
            </c:forEach>
          </select>
        </div>
        <div class="text-right">
          <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
          <input type="submit" class="btn btn-success" value="Lưu thay đổi">
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>