<%-- 
    Document   : adminViewRecycled
    Created on : Apr 3, 2016, 3:25:59 PM
    Author     : suhag
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Products Catalogue</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="css/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/ToyStore/adminDashboard">Admin Console</a>
                </div>
                <!-- Top Menu Items -->
                <ul class="nav navbar-right top-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Admin <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>
                            <li>
                                <a href="/ToyStore/adminInbox"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/ToyStore/adminLogout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li>
                            <a href="/ToyStore/adminDashboard"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="/ToyStore/adminCustomer"><i class="fa fa-fw fa-bar-chart-o"></i> Customers</a>
                        </li>
                        <li>
                            <a href="/ToyStore/adminProducts"><i class="fa fa-fw fa-table"></i>Products</a>
                        </li>
                        <li>
                            <a href="/ToyStore/adminApprovals"><i class="fa fa-fw fa-edit"></i>Approvals</a>
                        </li>
                        <li >
                            <a href="/ToyStore/adminAddProducts"><i class="fa fa-plus-square-o"></i> Add products</a>
                        </li>
                        <li>
                            <a href="/ToyStore/adminTransactions"><i class="fa fa-money fa-fw"></i> Transactions/ Order</a>
                        </li>
                        <li class="active">
                            <a href="/ToyStore/adminRecycledProducts"><i class="fa fa-fw fa-table"></i>Recycled Products</a>
                        </li>
                        <li>
                            <a href="/ToyStore/adminDiscount"><i class="fa fa-plus-square-o"></i> Add Discount</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                Products
                            </h1>
                            <ol class="breadcrumb">
                                <li class="active">
                                    <i class="fa fa-fw fa-table"></i> Products Catalogue -> Product details
                                </li>
                            </ol>
                        </div>
                    </div>

                    <div class="row">
                        <h3 class="panel-heading">
                            Product details
                        </h3>
                        <div class="col-sm-6">
                            <!-- Registration Block Starts -->
                            <!-- Personal Information Ends -->
                            <div class="panel panel-smart">

                                <!-- Delivery Information Starts -->
                                <div class="panel-body">
                                    <!-- Registration Form Starts -->
                                    <form class="form-horizontal" role="form">
                                        <!-- Personal Information Starts -->
                                        <div class="form-group">
                                            <label for="inputPname" class="col-sm-3 control-label" >Product Name :</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="inputPname" placeholder="Product Name" value="${product.name}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputModelNumber" class="col-sm-3 control-label">Model Number:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="inputModelNumber" placeholder="Model Number" value="${product.modelNum}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputBrand" class="col-sm-3 control-label">Brand:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="inputBrand" placeholder="Brand" value="${product.brand}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputDescription" class="col-sm-3 control-label">Description:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="inputDescription" placeholder="Description" value="${product.description}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputAvailability" class="col-sm-3 control-label">Availability:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="inputAvailability" placeholder="Availability" value="${product.quantity}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPrice" class="col-sm-3 control-label">Price:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="inputDescription" placeholder="Price" value="$ ${product.price}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputAdditionalInfo" class="col-sm-3 control-label">Additional Information:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="inputAdditionalInfo" placeholder="Additional Information" value="${product.addInfo}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputCategory" class="col-sm-3 control-label">Category:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="inputCategory" placeholder="Category" value="${product.categoryId.name}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <c:choose>
                                                    <c:when test="${!( product.approved)}">
                                                        <form action="/ToyStore/approveProduct" method="post">
                                                            <input type="hidden" name="productId" value="${product.id}">
                                                            <button type="button" class="btn btn-success" style="font-size: 14px;text-transform: uppercase;" value="/ToyStore/approveProduct">
                                                                approve
                                                                <i class="fa fa-check" style="margin-right: 5px;"></i>
                                                            </button>
                                                        </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button type="button" class="btn btn-cart disabled" style="font-size: 14px;color: #fff;text-transform: uppercase;" disabled="disabled">
                                                            approved
                                                            <i class="fa fa-check" style="margin-right: 5px;"></i>
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <!-- Payment Area Ends -->
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <a href="/ToyStore/getImage?productId=${product.id}">
                                <img src="/ToyStore/getImage?productId=${product.id}" alt="Image" class="img-responsive thumbnail" />
                            </a>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
                <div class="copyright container">
                    <div class="clearfix">
                        <!-- Starts -->
                        <p class="pull-right" >
                            <i class="fa fa-copyright" aria-hidden="true"></i> Toy Store. designed By <a href="#">Suhag Byaravalli Arun</a> and <a href="#">Ninand Tungare</a>. This web site exists to fulfill the coursework requirement of CS4280.
                            Do not use your real personal data as input.

                        </p>
                        <!-- Ends -->
                    </div>
                </div>
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="js/plugins/morris/raphael.min.js"></script>
        <script src="js/plugins/morris/morris.min.js"></script>
        <script src="js/plugins/morris/morris-data.js"></script>

    </body>

</html>

