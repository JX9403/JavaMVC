<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
        <meta name="author" content="Hỏi Dân IT" />
        <title>Details - Hỏi Dân IT</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
      </head>

      <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp" />
        <div id="layoutSidenav">
          <jsp:include page="../layout/sidebar.jsp" />
          <div id="layoutSidenav_content">
            <main>
              <div class="container-fluid px-4">
                <h1 class="mt-4">Manage Orders</h1>
                <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item ">

                    <a href="/admin">Dashboard</a>
                  </li>
                  <li class="breadcrumb-item ">
                    <a href="/admin/order">Orders</a>
                  </li>
                  <li class="breadcrumb-item active">Detail</li>
                </ol>


                <div class="mt-5">
                  <div class="row">
                    <div class="col-12 mx-auto">
                      <div class="d-flex justify-content-between">
                        <h3>Order Detail ${id}</h3>

                      </div>
                      <hr />
                      <table class="table table-borderer table-hover">
                        <thead>
                          <tr>
                            <th>Sản phẩm</th>
                            <th>Tên</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="od" items="${orderDetails}">
                            <tr class="mx-auto">
                              <td class="mx-auto">
                                <img style="width:80px; height: 80px; border-radius: 50%; overflow: hidden;"
                                  src="/images/product/${od.getProduct().getImage()}" />

                              </td>
                              <td>
                                <a class="mx-auto" style="width:100%; height: 100%;"
                                  href="/product/${od.getProduct().getId()}">${od.getProduct().getName()}</a>
                              </td>
                              <td>
                                <div class="mx-auto" style="width:100%; height: 100%;">
                                  ${od.price}
                                </div>
                              </td>
                              <td>
                                <div class="mx-auto" style="width:100%; height: 100%;"> ${od.quantity}
                                </div>
                              </td>

                              <td>
                                <div class="mx-auto" style="width:100%; height: 100%;">${od.price *
                                  od.quantity}</div>
                              </td>
                            </tr>
                          </c:forEach>

                        </tbody>
                      </table>

                      <a href="/admin/order" class="btn btn-success mt-3">Back</a>
                    </div>
                  </div>
                </div>
              </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
          </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
          crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
          crossorigin="anonymous"></script>
      </body>

      </html>