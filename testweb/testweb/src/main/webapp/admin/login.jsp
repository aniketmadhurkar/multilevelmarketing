 <jsp:include page="is_logged.jsp"/>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MLM Admin</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

  
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

            

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
              


                        <div class="topbar-divider d-none d-sm-block"></div>

                   

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container ">

                    <!-- Page Heading -->
                   

           
       <div class="col-md-6 mx-auto" style="margin-top:120px">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    Login
                </div>
                <div class="card-body">
                    <form method="post" action="admin-login-check.jsp" class="">
                        <div class="form-group">
                            <input type="text" name="userid" class="form-control" placeholder="Userid">
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" value="" class="form-control" placeholder="Password">
                        </div>
                        <div class="submit"><input type="submit" value="Login" class="btn btn-primary"></div>
                        <p><%
    if (request.getParameter("msg") != null) {
        out.println("Invalid Login");
    }
%></p>
                    </form>
                </div>
            </div>
        </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->


 <!-- Footer -->
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; MLM  2023</span>
            </div>
        </div>
    </footer>
    <!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
<i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin-2.min.js"></script>

</body>

</html>