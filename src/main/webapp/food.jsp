<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/11/2021
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"crossorigin="anonymous">
  <link href="style_main.css" rel="stylesheet">
  <link rel="stylesheet" href="style_cart.css">
  <title>VNFood</title>
  <style>
    .nav-item:hover{
      background-color:cornflowerblue;
    }
    @media (min-width:980px) and (max-width:1024px) {
      .nav-link{
        height: 100%;
      }
    }
    .card-img-top{
      height: 250px;
      width: 400px;
    }
    .hotline-phone-ring-wrap {
      position: fixed;
      bottom: 0;
      left: 0;
      z-index: 999999;
    }

    .hotline-bar {
      position: absolute;
      background: rgba(230, 8, 8, 0.75);
      height: 40px;
      width: 180px;
      line-height: 40px;
      border-radius: 3px;
      padding: 0 10px;
      background-size: 100%;
      cursor: pointer;
      z-index: 9;
      box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.1);
      left: 33px;
      bottom: 37px;
    }
    .hotline-bar > a {
      color: #fff;
      text-decoration: none;
      font-size: 15px;
      font-weight: bold;
      text-indent: 50px;
      display: block;
      letter-spacing: 1px;
      line-height: 40px;
      font-family: Arial;
    }
  </style>
</head>
<body>

<header>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid" style="background-color: gray;">
      <a class="navbar-brand" href="#"><img src="https://phuotvivu.com/blog/wp-content/uploads/2018/08/nha-hang-viet-nam-mon-an-viet-singapore.jpg" style="width: 150px;height: 80px;" alt=""></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarScroll">
        <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
          <li class="nav-item" style="line-height: 80px;">
            <a class="nav-link active"  href="#">Trang Chu</a>
          </li>
          <li class="nav-item" style="line-height: 80px;">
            <a class="nav-link" href="#">Ve Chung Toi</a>
          </li>
          <li class="nav-item dropdown" style="line-height: 80px;">
            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="true">
              Danh Muc
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
              <li><a class="dropdown-item" href="#">Do Uong</a></li>
              <li><a class="dropdown-item" href="#">Do An</a></li>
              <li><a class="dropdown-item" href="#"> Do Choi</a></li>
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
          <li class="nav-item"style="line-height: 80px;">
            <a class="nav-link" href="#">Lien He</a>
          </li>


        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <div class="btn-group ms-3">
            <button id="cart" type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              <svg style="margin-bottom: 4px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
              </svg>  Gio Hang
            </button>
            <div id="myModal" class="modal">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Giỏ Hàng</h5>
                  <span  class="close">&times;</span>
                </div>
                <div class="modal-body">
                  <div class="cart-row">
                    <span class="cart-item cart-header cart-column">Sản Phẩm</span>
                    <span class="cart-price cart-header cart-column">Giá</span>
                    <span class="cart-quantity cart-header cart-column">Số Lượng</span>
                  </div>
                  <div class="cart-items">
                    <div class="cart-row">
                      <div class="cart-item cart-column">
                        <img class="cart-item-image" src="https://cdn3.ivivu.com/2017/08/bay-mon-an-noi-tieng-co-ten-doc-la-o-viet-nam-ivivu-3.jpg" width="100" height="100">
                        <span class="cart-item-title">Do An</span>
                      </div>
                      <span class="cart-price cart-column">25000đ</span>
                      <div class="cart-quantity cart-column">
                        <input class="cart-quantity-input" type="number" value="1">
                        <button class="btn btn-danger" type="button">Xóa</button>
                      </div>
                    </div>
                    <div class="cart-row">
                      <div class="cart-item cart-column">
                        <img class="cart-item-image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsRie3z8Wfb-xxB29eL5docgKYfTZ5iVQ6tQ&usqp=CAU" width="120" height="100">
                        <span class="cart-item-title">Do An</span>
                      </div>
                      <span class="cart-price cart-column">1599000đ</span>
                      <div class="cart-quantity cart-column">
                        <input class="cart-quantity-input" type="number" value="2">
                        <button class="btn btn-danger" type="button">Xóa</button>
                      </div>
                    </div>
                  </div>
                  <div class="cart-total">
                    <strong class="cart-total-title">Tổng Cộng:</strong>
                    <span class="cart-total-price">0VNĐ</span>
                  </div>
                </div>

                <div class="modal-footer">
                  <button  type="button" class="btn btn-secondary close-footer">Đóng</button>
                  <button  type="button" class="btn btn-primary order">Thanh Toán</button>
                </div>
              </div>
            </div>
          </div>
          <button id="login" type="button" class="guest btn btn-primary ms-3" data-bs-toggle="modal" data-bs-target="#modal-login"><span >Login</span></button>
        </form>
      </div>
    </div>
  </nav>
  <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="https://www.chupsanpham.net/wp-content/uploads/2014/02/chup-anh-san-pham-mon-an-3-1-900x600.jpg" class="d-block w-100" alt="..." style="height: 600px;">
        <div class="carousel-caption d-none d-md-block">
          <h5>First slide label</h5>
          <p>Some representative placeholder content for the first slide.</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="https://bestlifetips.net/wp-content/uploads/2021/07/banh-xeo-mien-bac-e1439303619944.jpg" class="d-block w-100" alt="..." style="height: 600px;">
        <div class="carousel-caption d-none d-md-block">
          <h5>Second slide label</h5>
          <p>Some representative placeholder content for the second slide.</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="https://phuotvivu.com/blog/wp-content/uploads/2018/08/nha-hang-viet-nam-mon-an-viet-singapore.jpg" class="d-block w-100" alt="..."  style="height: 600px;">
        <div class="carousel-caption d-none d-md-block">
          <h5>Third slide label</h5>
          <p>Some representative placeholder content for the third slide.</p>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</header>

<main>


  <div class="container pt-5">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      <c:forEach items="${list}" var="o">
      <div class="col">
        <div class="card p-0">
          <div class="card-img-top"><img style="height: 100%;width: 100%;" src="${o.image}" alt=""></div>
          <div class="card-body ">
            <div style="text-align: center;" >
              <h4 class="card-title show_txt"> </h4>
              <h3 class="card-text food-title" style="color:green;"><a href="detail?id=${o.id}" title="View Food">${o.name}</a></h3>
              <p style="font-size: 20px; color: red;" class="money">${o.price} VNĐ</p>
            </div>
            <div  style="margin-top: 20px;"><hr>
              <button  type="button" class="btn btn-success btn-cart" style="margin-right: 15px;min-width: 100px;">Add To Cart</button>
              <button  type="button" class="btn btn-success" style="float: right;min-width: 100px;">Order</button>
            </div>
          </div>
        </div>
      </div>
      </c:forEach>


    </div>
  </div>
  <div class="hotline-phone-ring-wrap">
    <div class="hotline-bar">
      <a href="tel:0123456789">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
          <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
        </svg>
      </a>
    </div>
  </div>
</main>

<!-- Footer -->
<footer class="text-center text-lg-start bg-light text-muted">
  <!-- Section: Social media -->
  <section
          class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom"
  >


    <div>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-twitter"></i>
      </a>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-google"></i>
      </a>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-instagram"></i>
      </a>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-linkedin"></i>
      </a>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-github"></i>
      </a>
    </div>
    <!-- Right -->
  </section>
  <!-- Section: Social media -->

  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
            <i class="fas fa-gem me-3"></i>Company name
          </h6>
          <p>
            Here you can use rows and columns to organize your footer content. Lorem ipsum
            dolor sit amet, consectetur adipisicing elit.
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Products
          </h6>
          <p>
            <a href="#!" class="text-reset">Angular</a>
          </p>
          <p>
            <a href="#!" class="text-reset">React</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Vue</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Laravel</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Useful links
          </h6>
          <p>
            <a href="#!" class="text-reset">Pricing</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Settings</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Orders</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Help</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Contact
          </h6>
          <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            info@example.com
          </p>
          <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
          <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2021 Copyright:
    <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="main.js"></script>
</body>
</html>
