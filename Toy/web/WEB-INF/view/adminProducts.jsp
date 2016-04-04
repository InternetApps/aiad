<%-- 
    Document   : adminProducts
    Created on : Apr 3, 2016, 3:23:04 PM
    Author     : suhag
--%>

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
                <a class="navbar-brand" href="index.html">Admin Console</a>
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
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
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
                    <li class="active">
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
                    <li>
                        <a href="/ToyStore/adminRecycledProducts"><i class="fa fa-fw fa-table"></i>Recycled Products</a>
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
                                <i class="fa fa-fw fa-table"></i> Products Catalogue
                            </li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                    <!-- Registration Block Starts -->
                    <!-- Personal Information Ends -->
                        <h3 class="panel-heading">
                            Search Product
                        </h3>
                        <div class="panel panel-smart">

                            <!-- Delivery Information Starts -->
                            <div class="panel-body">
                            <!-- Registration Form Starts -->
                                <form class="form-horizontal" role="form">
                                <!-- Personal Information Starts -->
                                    <div class="form-group">
                                        <label for="inputPname" class="col-sm-3 control-label">Product Name :</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="inputPname" placeholder="Product Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputModelNumber" class="col-sm-3 control-label">Model Number:</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="inputModelNumber" placeholder="Model Number">
                                        </div>
                                    </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-9">
                                        <button type="submit" class="btn btn-danger">
                                            Search
                                        </button>
                                    </div>
                                </div>
                            <!-- Payment Area Ends -->
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Product Search Result</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Product ID #</th>
                                                <th>Model Number</th>
                                                <th>Product Name</th>
                                                <th>Price</th>
                                                <th>Available Stock</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>3326</td>
                                                <td>10/21/2013</td>
                                                <td>3:29 PM</td>
                                                <td>$321.33</td>
                                                <td>$321.33</td>
                                                <td>
                                                    <a href="adminEditProducts.html">
                                                        <div>
                                                            <span class="pull-left">Edit</span>
                                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
                                                <td>10/21/2013</td>
                                                <td>3:20 PM</td>
                                                <td>$234.34</td>
                                                <td>$321.33</td>
                                                <td>
                                                    <a href="#">
                                                        <div>
                                                            <span class="pull-left">Edit</span>
                                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
                                                <td>10/21/2013</td>
                                                <td>3:03 PM</td>
                                                <td>$724.17</td>
                                                <td>$321.33</td>
                                                <td>
                                                    <a href="#">
                                                        <div>
                                                            <span class="pull-left">Edit</span>
                                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
                                                <td>10/21/2013</td>
                                                <td>3:00 PM</td>
                                                <td>$23.71</td>
                                                <td>$321.33</td>
                                                <td>
                                                    <a href="#">
                                                        <div>
                                                            <span class="pull-left">Edit</span>
                                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
                                                <td>10/21/2013</td>
                                                <td>2:49 PM</td>
                                                <td>$8345.23</td>
                                                <td>$321.33</td>
                                                <td>
                                                    <a href="#">
                                                        <div>
                                                            <span class="pull-left">Edit</span>
                                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
                                                <td>10/21/2013</td>
                                                <td>2:23 PM</td>
                                                <td>$245.12</td>
                                                <td>$321.33</td>
                                                <td>
                                                    <a href="#">
                                                        <div>
                                                            <span class="pull-left">Edit</span>
                                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
                                                <td>10/21/2013</td>
                                                <td>2:15 PM</td>
                                                <td>$5663.54</td>
                                                <td>$321.33</td>
                                                <td>
                                                    <a href="#">
                                                        <div >
                                                            <span class="pull-left">Edit</span>
                                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
                                                <td>10/21/2013</td>
                                                <td>2:13 PM</td>
                                                <td>$943.45</td>
                                                <td>$321.33</td>
                                                <td>
                                                    <a href="#">
                                                        <div>
                                                            <span class="pull-left">Edit</span>
                                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

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
