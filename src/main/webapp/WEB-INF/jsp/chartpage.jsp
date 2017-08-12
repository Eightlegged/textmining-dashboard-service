<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>��ú���</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

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
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">SB Admin</a>
		</div>
		<!-- Top Menu Items -->
		<ul class="nav navbar-right top-nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-envelope"></i> <b
					class="caret"></b></a>
				<ul class="dropdown-menu message-dropdown">
					<li class="message-preview"><a href="#">
							<div class="media">
								<span class="pull-left"> <img class="media-object"
									src="http://placehold.it/50x50" alt="">
								</span>
								<div class="media-body">
									<h5 class="media-heading">
										<strong>John Smith</strong>
									</h5>
									<p class="small text-muted">
										<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
									</p>
									<p>Lorem ipsum dolor sit amet, consectetur...</p>
								</div>
							</div>
					</a></li>
					<li class="message-preview"><a href="#">
							<div class="media">
								<span class="pull-left"> <img class="media-object"
									src="http://placehold.it/50x50" alt="">
								</span>
								<div class="media-body">
									<h5 class="media-heading">
										<strong>John Smith</strong>
									</h5>
									<p class="small text-muted">
										<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
									</p>
									<p>Lorem ipsum dolor sit amet, consectetur...</p>
								</div>
							</div>
					</a></li>
					<li class="message-preview"><a href="#">
							<div class="media">
								<span class="pull-left"> <img class="media-object"
									src="http://placehold.it/50x50" alt="">
								</span>
								<div class="media-body">
									<h5 class="media-heading">
										<strong>John Smith</strong>
									</h5>
									<p class="small text-muted">
										<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
									</p>
									<p>Lorem ipsum dolor sit amet, consectetur...</p>
								</div>
							</div>
					</a></li>
					<li class="message-footer"><a href="#">Read All New
							Messages</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-bell"></i> <b
					class="caret"></b></a>
				<ul class="dropdown-menu alert-dropdown">
					<li><a href="#">Alert Name <span
							class="label label-default">Alert Badge</span></a></li>
					<li><a href="#">Alert Name <span
							class="label label-primary">Alert Badge</span></a></li>
					<li><a href="#">Alert Name <span
							class="label label-success">Alert Badge</span></a></li>
					<li><a href="#">Alert Name <span class="label label-info">Alert
								Badge</span></a></li>
					<li><a href="#">Alert Name <span
							class="label label-warning">Alert Badge</span></a></li>
					<li><a href="#">Alert Name <span
							class="label label-danger">Alert Badge</span></a></li>
					<li class="divider"></li>
					<li><a href="#">View All</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b
					class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
					<li><a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
					</li>
					<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
					</li>
					<li class="divider"></li>
					<li><a href="#"><i class="fa fa-fw fa-power-off"></i> Log
							Out</a></li>
				</ul></li>
		</ul>
		<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li class="active"><a href="/Dashboard1"><i
						class="fa fa-fw fa-dashboard"></i> Dashboard</a></li>
				<li><a href="/chart1"><i class="fa fa-fw fa-bar-chart-o"></i>
						Charts</a></li>
				<li><a href="/investform"><i class="fa fa-fw fa-table"></i>
						Tables</a></li>
				<li><a href="/enrollform"><i class="fa fa-fw fa-edit"></i>
						Forms</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse --> </nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">��Ʈ</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="/Dashboard1">Dashboard</a>
							</li>
							<li class="active"><i class="fa fa-bar-chart-o"></i> Charts
							</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

			<div class="row">
					<div class="col-lg-3">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-comments fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">

										<div class="huge">������</div>
									</div>
								</div>
							</div>
							<div class="panel-body" style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" >
									<button type="button"
										class="list-group-item list-group-item-action" onclick="showdata('������')">
										����1</button>
									<button type="button"
										class="list-group-item list-group-item-action">Dapibus
										ac facilisis in</button>
									<button type="button"
										class="list-group-item list-group-item-action">Morbi
										leo risus</button>
									<button type="button"
										class="list-group-item list-group-item-action">Porta
										ac consectetur ac</button>
									<button type="button"
										class="list-group-item list-group-item-action" disabled>Vestibulum
										at eros</button>
										
								</div>
								
							</div>

						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-comments fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">

										<div class="huge">������</div>
									</div>
								</div>
							</div>
							<div class="panel-body" style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" >
									<button type="button"
										class="list-group-item list-group-item-action" onclick="showdata('������')">
										����1</button>
									<button type="button"
										class="list-group-item list-group-item-action">Dapibus
										ac facilisis in</button>
									<button type="button"
										class="list-group-item list-group-item-action">Morbi
										leo risus</button>
									<button type="button"
										class="list-group-item list-group-item-action">Porta
										ac consectetur ac</button>
									<button type="button"
										class="list-group-item list-group-item-action" disabled>Vestibulum
										at eros</button>
										
								</div>
								
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-comments fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">

										<div class="huge">������</div>
									</div>
								</div>
							</div>
							<div class="panel-body" style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" >
									<button type="button"
										class="list-group-item list-group-item-action" onclick="showdata('������')">
										����1</button>
									<button type="button"
										class="list-group-item list-group-item-action">Dapibus
										ac facilisis in</button>
									<button type="button"
										class="list-group-item list-group-item-action">Morbi
										leo risus</button>
									<button type="button"
										class="list-group-item list-group-item-action">Porta
										ac consectetur ac</button>
									<button type="button"
										class="list-group-item list-group-item-action" disabled>Vestibulum
										at eros</button>
										
								</div>
								
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-comments fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">

										<div class="huge">������</div>
									</div>
								</div>
							</div>
							<div class="panel-body" style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" >
									<button type="button"
										class="list-group-item list-group-item-action" onclick="showdata('������')">
										����1</button>
									<button type="button"
										class="list-group-item list-group-item-action">Dapibus
										ac facilisis in</button>
									<button type="button"
										class="list-group-item list-group-item-action">Morbi
										leo risus</button>
									<button type="button"
										class="list-group-item list-group-item-action">Porta
										ac consectetur ac</button>
									<button type="button"
										class="list-group-item list-group-item-action" disabled>Vestibulum
										at eros</button>
										
								</div>
								
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4">
						<div class="panel panel-green">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i> Pie Chart Example with
									Tooltips
								</h3>
							</div>
							<div class="panel-body">
								<div class="flot-chart">
									<div class="flot-chart-content" id="flot-pie-chart"></div>
								</div>
								<div class="text-right">
									<a href="#">View Details <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i> Multiple Axes Line Graph
									Example with Tooltips and Raw Data
								</h3>
							</div>
							<div class="panel-body">
								<div class="flot-chart">
									<div class="flot-chart-content" id="flot-multiple-axes-chart"></div>
								</div>
								<div class="text-right">
									<a href="#">View Details <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i> Moving Line Chart
								</h3>
							</div>
							<div class="panel-body">
								<div class="flot-chart">
									<div class="flot-chart-content" id="flot-moving-line-chart"></div>
								</div>
								<div class="text-right">
									<a href="#">View Details <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i> Bar Graph with Tooltips
								</h3>
							</div>
							<div class="panel-body">
								<div class="flot-chart">
									<div class="flot-chart-content" id="flot-bar-chart"></div>
								</div>
								<div class="text-right">
									<a href="#">View Details <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->

				<!-- Morris Charts -->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">Morris Charts</h2>
						<p class="lead">
							Morris.js is a very simple API for drawing line, bar, area and
							donut charts. For full usage instructions and documentation for
							Morris.js charts, visit <a
								href="http://morrisjs.github.io/morris.js/">http://morrisjs.github.io/morris.js/</a>.
						</p>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-green">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-bar-chart-o"></i> Area Line Graph Example with
									Tooltips
								</h3>
							</div>
							<div class="panel-body">
								<div id="morris-area-chart"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-4">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i> Donut Chart Example
								</h3>
							</div>
							<div class="panel-body">
								<div id="morris-donut-chart"></div>
								<div class="text-right">
									<a href="#">View Details <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="panel panel-red">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i> Line Graph Example with
									Tooltips
								</h3>
							</div>
							<div class="panel-body">
								<div id="morris-line-chart"></div>
								<div class="text-right">
									<a href="#">View Details <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i> Bar Graph Example
								</h3>
							</div>
							<div class="panel-body">
								<div id="morris-bar-chart"></div>
								<div class="text-right">
									<a href="#">View Details <i
										class="fa fa-arrow-circle-right"></i></a>
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

	<!-- Flot Charts JavaScript -->
	<!--[if lte IE 8]><script src="js/excanvas.min.js"></script><![endif]-->
	<script src="js/plugins/flot/jquery.flot.js"></script>
	<script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="js/plugins/flot/jquery.flot.resize.js"></script>
	<script src="js/plugins/flot/jquery.flot.pie.js"></script>
	<script src="js/plugins/flot/flot-data.js"></script>

</body>

</html>