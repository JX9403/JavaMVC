<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Update Order</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
                  <li class="breadcrumb-item active">Update</li>
                </ol>


                <div class=" mt-5">
                  <div class="col-md-6 col-12 mx-auto">
                    <h3>Update a order with id : ${id} </h3>
                    <hr />

                    <form:form method="post" action="/admin/order/update" modelAttribute="order"
                      enctype="multipart/form-data" class="row">
                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                      <div class="mb-3" style="display: none;">
                        <label class="form-label">Id:</label>
                        <form:input type="text" class="form-control" path="id" />
                      </div>
                      <div class=" mb-3 col-12 col-md-6">
                        <label for="name" class="form-label">Tổng tiền:</label>
                        <form:input type="text" class="form-control" path="totalPrice" disabled="true" />
                      </div>

                      <div class="mb-3 col-12 col-md-6 ">

                        <label for="price" class="form-label">User:</label>
                        <form:input class="form-control " path="user.fullName" disabled="true" />
                      </div>

                      <div class="mb-3 col-md-6 col-12">
                        <label class="form-label">Status:</label>
                        <form:select class="form-select" path="status">
                          <form:option value="PENDING">PENDING</form:option>
                          <form:option value="SHIPPING">SHIPPING</form:option>
                          <form:option value="COMPLETED">COMPLETED</form:option>
                          <form:option value="CANCEL">CANCEL</form:option>
                        </form:select>
                      </div>

                      <div class="col-12 mb-5">
                        <button type="submit" class="btn btn-primary ">Update</button>
                      </div>

                    </form:form>
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