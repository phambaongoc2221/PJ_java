<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/11/2021
  Time: 9:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Food Detail</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="style_cart.css">
  <style>
    #img{
      height: 400px;
      width:350px;
    }
    /* modal */
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      padding-top: 100px;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgb(0, 0, 0);
      background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
      margin: 0 auto;
      width: 50%;
      position: relative;
      display: flex;
      flex-direction: column;
      background-color: #fff;
      background-clip: padding-box;
      border: 1px solid rgba(0, 0, 0, .2);
      border-radius: .3rem;
      outline: 0;

    }

    .modal-body {
      padding: 1rem;
    }

    .modal-footer {
      display: flex;
      border-top: 1px solid #aaaaaa;
      padding: 1rem;
      flex-direction: row;
      justify-content: flex-end;
      border-top: 1px solid #aaaaaa;
      padding: 1rem;
    }

    .modal-footer>:not(:first-child) {
      margin-left: .25rem;
    }

    .btn {
      cursor: pointer;
      outline: none;
      font-weight: 400;
      line-height: 1.25;
      text-align: center;
      white-space: nowrap;
      vertical-align: middle;
      border: 1px solid transparent;
      padding: .5rem 1rem;
      font-size: 1rem;
      border-radius: .25rem;
      transition: all .2s ease-in-out;
    }

    .btn-secondary {
      color: #292b2c;
      background-color: #fff;
      border-color: #ccc;
    }

    .btn-primary {
      color: #fff;
      background-color: #0275d8;
      border-color: #0275d8;
    }

    .modal-header {
      align-items: center;
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid #aaaaaa;
      padding: 1rem;
    }

    h5.modal-title {
      font-size: 1.5rem;
    }

    .close {
      color: #aaaaaa;
      font-size: 28px;
      font-weight: bold;
      display: flex;
      flex-direction: row;
      justify-content: flex-end;
    }

    .close:hover,
    .close:focus {
      color: #000;
      text-decoration: none;
      cursor: pointer;
    }

    #cart {
      font-size: 15px;
      color: #fff;
      background: #c7b200;
      border: 1px solid transparent;
      border-radius: 10px;
      outline: none;
      margin-left: 1rem;
      padding: 12px;
      cursor: pointer;
    }

    #cart:hover {
      border-color: #fff;
    }
    /* cart */
    .cart-header {
      font-weight: bold;
      font-size: 1.25em;
      color: #333;
    }

    .cart-column {
      display: flex;
      align-items: center;
      border-bottom: 1px solid black;
      margin-right: 1.5em;
      padding-bottom: 10px;
      margin-top: 10px;
    }

    .cart-row {
      display: flex;
    }

    .cart-item {
      width: 45%;
    }

    .cart-price {
      width: 20%;
      font-size: 1.2em;
      color: #333;
    }

    .cart-quantity {
      width: 35%;
    }

    .cart-item-title {
      color: #333;
      margin-left: .5em;
      font-size: 1.2em;
    }

    .cart-item-image {
      width: 75px;
      height: auto;
      border-radius: 10px;
    }

    .btn-danger {
      color: white;
      background-color: #EB5757;
      border: none;
      border-radius: .3em;
      font-weight: bold;
    }

    .btn-danger:hover {
      background-color: #CC4C4C;
    }

    .cart-quantity-input {
      height: 34px;
      width: 50px;
      border-radius: 5px;
      border: 1px solid #56CCF2;
      background-color: #eee;
      color: #333;
      padding: 0;
      text-align: center;
      font-size: 1.2em;
      margin-right: 25px;
    }

    .cart-row:last-child {
      border-bottom: 1px solid black;
    }

    .cart-row:last-child .cart-column {
      border: none;
    }

    .cart-total {
      text-align: end;
      margin-top: 10px;
      margin-right: 10px;
    }

    .cart-total-title {
      font-weight: bold;
      font-size: 1.5em;
      color: black;
      margin-right: 20px;
    }

    .cart-total-price {
      color: #333;
      font-size: 1.1em;
    }


  </style>
</head>
<html>
<body>
<header>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid" style="background-color: gray;">
      <a class="navbar-brand" href="#"><img src="https://xebanhmithonhiky.vn/wp-content/uploads/2020/09/B%C3%AD-quy%E1%BA%BFt-b%C3%A1n-b%C3%A1nh-m%C3%AC-%C4%91%C3%B4ng-kh%C3%A1ch-999x1024.jpg" style="width: 150px;height: 80px;" alt=""></a>
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
            <!-- <ul class="dropdown-menu">
                <li><a class="dropdown-item">🇬🇧 English</a></li>
                <li><a class="dropdown-item">🇫🇷 Français</a></li>
                <li><a class="dropdown-item" >🇻🇳 Tiếng Việt</a></li>
            </ul> -->
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
</header>
<main class="container mt-3" >

  <div>

    <div class="row  mt-3">
      <div class="col-sm-5 order-sm-1 order-2">
        <img id="img" class="img-prd" src="${detail.image}" >
      </div>
      <div class="col-sm-7 order-sm-2 order-1">
        <h1 class="content-product-h3" style="margin-bottom:30px;">${detail.name}</h1>
        <div class="price">
          Price: <span style="margin-bottom:30px;font-size: 30px;" class="text-primary money" > ${detail.price} <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16">
                              <path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z"/>
                            </svg></span>
          <hr>
        </div>
        Number:      <input style="margin-left: 20px;" aria-label="quantity" class="input-qty" max="1000" min="1" name="" type="number" value="1"><br>
        <div id="button" style="margin-top: 20px;"><hr>
          <button id="btn-add-cart" type="button" class="btn btn-success btn-cart" style="margin-right: 15px;">Add To Cart</button>
          <button id="btn-order" type="button" class="btn btn-success">Order</button>
          <hr>
          <p>Đánh giá món ăn</p>
          <style>
            /**
     * Để cho đơn giản nhất mình dùng icon star của font awesome.
     * À mà khoan, ở đây chúng ta chỉ làm tut nhỏ nên thấy import cả 1 library font-awesome có vẻ hơi quá đáng đã vậy còn ngược lại tiêu chí
     * "HẠN CHẾ TỐI DÙNG THƯ VIỆN NGOÀI" :D chắc các bạn nghĩ thế nhỉ? Hiện tại chúng ta chỉ implement 1 tut nhỏ thì có vẻ thừa,
     * nhưng trong project mình đang code có sẵn font-awesome nên trên thực tế mình đâu có * thêm gì đâu :D
     */
            @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
            /*reset css*/
            div,label{margin:0;padding:0;}
            body{margin:20px;}
            h1{font-size:1.5em;margin:10px;}
            /****** Style Star Rating Widget *****/
            #rating{border:none;float:left;}
            #rating>input{display:none;}/*ẩn input radio - vì chúng ta đã có label là GUI*/
            #rating>label:before{margin:5px;font-size:1.25em;font-family:FontAwesome;display:inline-block;content:"\f005";}/*1 ngôi sao*/
            #rating>.half:before{content:"\f089";position:absolute;}/*0.5 ngôi sao*/
            #rating>label{color:#ddd;float:right;}/*float:right để lật ngược các ngôi sao lại đúng theo thứ tự trong thực tế*/
            /*thêm màu cho sao đã chọn và các ngôi sao phía trước*/
            #rating>input:checked~label,
            #rating:not(:checked)>label:hover,
            #rating:not(:checked)>label:hover~label{color:#FFD700;}
            /* Hover vào các sao phía trước ngôi sao đã chọn*/
            #rating>input:checked+label:hover,
            #rating>input:checked~label:hover,
            #rating>label:hover~input:checked~label,
            #rating>input:checked~label:hover~label{color:#FFED85;}
          </style>
          <div id="rating">
            <input type="radio" id="star5" name="rating" value="5" />
            <label class = "full" for="star5" title="Awesome - 5 stars"></label>

            <input type="radio" id="star4" name="rating" value="4" />
            <label class = "full" for="star4" title="Pretty good - 4 stars"></label>

            <input type="radio" id="star3" name="rating" value="3" />
            <label class = "full" for="star3" title="Meh - 3 stars"></label>

            <input type="radio" id="star2" name="rating" value="2" />
            <label class = "full" for="star2" title="Kinda bad - 2 stars"></label>

            <input type="radio" id="star1" name="rating" value="1" />
            <label class = "full" for="star1" title="Sucks big time - 1 star"></label>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div style="margin-top: 30px;color: red;">
    <p>  Giới thiệu món ăn ----------------------------------------------------------------------------------------------------------------</p>
  </div>
  <div>${detail.script}</div>
</main>
<script>
  // Modal
  var modal = document.getElementById("myModal");
  var btn = document.getElementById("cart");
  var close = document.getElementsByClassName("close")[0];
  var close_footer = document.getElementsByClassName("close-footer")[0];
  var order = document.getElementsByClassName("order")[0];
  btn.onclick = function () {
    modal.style.display = "block";
  }
  close.onclick = function () {
    modal.style.display = "none";
  }
  close_footer.onclick = function () {
    modal.style.display = "none";
  }
  order.onclick = function () {
    alert("Cảm ơn bạn đã thanh toán đơn hàng")
  }

  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }

  // xóa cart
  var remove_cart = document.getElementsByClassName("btn-danger");
  for (var i = 0; i < remove_cart.length; i++) {
    var button = remove_cart[i]
    button.addEventListener("click", function () {
      var button_remove = event.target
      button_remove.parentElement.parentElement.remove()
      updatecart()
    })
  }
  // thay đổi số lượng sản phẩm
  var quantity_input = document.getElementsByClassName("cart-quantity-input");
  for (var i = 0; i < quantity_input.length; i++) {
    var input = quantity_input[i];
    input.addEventListener("change", function (event) {
      var input = event.target
      if (isNaN(input.value) || input.value <= 0) {
        input.value = 1;
      }
      updatecart()
    })
  }
  // update cart
  function updatecart() {
    var cart_item = document.getElementsByClassName("cart-items")[0];
    var cart_rows = cart_item.getElementsByClassName("cart-row");
    var total = 0;
    for (var i = 0; i < cart_rows.length; i++) {
      var cart_row = cart_rows[i]
      var price_item = cart_row.getElementsByClassName("cart-price ")[0]
      var quantity_item = cart_row.getElementsByClassName("cart-quantity-input")[0]
      var price = parseFloat(price_item.innerText)
      var quantity = quantity_item.value
      total = total + (price * quantity)
    }
    document.getElementsByClassName("cart-total-price")[0].innerText = total + 'VNĐ'

  }





  //them vào giỏ
  var add_cart = document.getElementsByClassName("btn-cart");
  for(var i = 0;i<add_cart.length;i++){
    var add = add_cart[i]
    add.addEventListener("click",function(event){
      var button = event.target
      var product = button.parentElement.parentElement
      var img = product.parentElement.getElementsByClassName("img-prd")[0].src
      var title = product.getElementsByClassName("content-product-h3")[0].innerText
      var price = product.getElementsByClassName("money")[0].innerText
      addItemToCart(title, price, img)
      modal.style.display="block"
      updatecart()

    })
  }
  function addItemToCart(title, price, img){
    var cartRow = document.createElement('div')
    cartRow.classList.add('cart-row')
    var cartItems = document.getElementsByClassName('cart-items')[0]
    var cart_title = cartItems.getElementsByClassName('cart-item-title')
    for (var i = 0; i < cart_title.length; i++) {
      if (cart_title[i].innerText == title) {
        alert('Sản Phẩm Đã Có Trong Giỏ Hàng')
        return
      }
    }
    var cartRowContents = `
  <div class="cart-item cart-column">
      <img class="cart-item-image" src="${img}" width="100" height="100">
      <span class="cart-item-title">${title}</span>
  </div>
  <span class="cart-price cart-column">${price}</span>
  <div class="cart-quantity cart-column">
      <input class="cart-quantity-input" type="number" value="1">
      <button class="btn btn-danger" type="button">Xóa</button>
  </div>`
    cartRow.innerHTML = cartRowContents
    cartItems.append(cartRow)
    cartRow.getElementsByClassName('btn-danger')[0].addEventListener('click', function () {
      var button_remove = event.target
      button_remove.parentElement.parentElement.remove()
      updatecart()
    })
    cartRow.getElementsByClassName('cart-quantity-input')[0].addEventListener('change', function (event) {
      var input = event.target
      if (isNaN(input.value) || input.value <= 0) {
        input.value = 1;
      }
      updatecart()
    })
  }
  function calcRate(r) {
    const f = ~~r,//Tương tự Math.floor(r)
            id = 'star' + f + (r % f ? 'half' : '')
    id && (document.getElementById(id).checked = !0)
  }

</script>
</body>
</html>
