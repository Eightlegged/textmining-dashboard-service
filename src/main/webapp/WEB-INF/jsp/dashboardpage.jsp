<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SMA</title>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>


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
<script src="/js/d3.min.js" charset="utf-8"></script>
<link href="http://www.google.com/uds/css/gsearch.css" type="text/css"
	rel="stylesheet" />
<script
	src="http://www.google.com/uds/api?file=uds.js&amp;v=1.0&amp;key="AIzaSyCxKYf4LbVXoy6nk3BlVQZSyKb5tRR6rx4"></script>
<style type="text/css">
@import url("http://www.google.com/uds/css/gsearch.css");
</style>
<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
<script src="/js/d3pie.js"></script>

<script>

$( document ).ready(function() {
	 
$.ajax({
	type : "POST",
	url : "/teammeeting",
	dataType:"json",
	error : function() {
		alert('통신실패!!');
	},
	success : function(data) {
		
		for(i=0;i<data.length;i++){
			
			var str="<button type='button' id="+i+">"+data[i].mt_name +" "+data[i].mt_date+"</button>";	
		
			if(data[i].mt_part=="RnD"){
			$('#meetinglist1').append(str);}
			else if(data[i].mt_part=="Softlayer"){
				$('#meetinglist2').append(str);
			}else if(data[i].mt_part=="Bluemix"){
				$('#meetinglist3').append(str);
			}else if(data[i].mt_part=="테스트파트"){
				$('#meetinglist4').append(str);
			}
			$('#'+i).attr("class",'list-group-item');
			$('#'+i).attr("onclick",'showdata('+"'"+data[i].meeting_id+"'"+')');
			str="";
		}
	
	}

});
});
	function showdata(team) {
		alert(team);
		
		$.ajax({

			type : "POST",
			url : "/detailpietextword",
			dataType : "json",
			data : {
				part : team
			},
			error : function() {
				alert('통신실패!!');
			},
			success : function(data) {
				$('svg').remove();
				var pie = new d3pie("pie", {
					header : {
						title : {
							text : "분석 파이"
						}
					},
					data : {
						content : data

					}
				});
			}

		});

		$.ajax({

			type : "POST",
			url : "/alldetailpietextword",
			dataType : "json",
			data : {
				part : team
			},
			error : function() {
				alert('통신실패!!');
			},
			success : function(alldata) {
				$('#keywordtable > tbody >tr').remove();
				for (i = 0; i < alldata.length; i++)
					$('#keywordtable > tbody').append(
							'<tr><td>' + (i + 1) + '</td>' + '<td>'
									+ alldata[i].keyword + '</td><td>'
									+ alldata[i].keywordnum + '</td></tr>');
			}

		});
		$.ajax({

			type : "POST",
			url : "/showpaper",
			dataType : "text",
			data : {
				part : team
			},
			error : function() {
				alert('통신실패!!');
			},
			success : function(text) {
				$('#textpaper >p ').remove();
				text = text.replace(/1./gi, "<br><br>1.");
				text = text.replace(/2./gi, "<br><br>2.");
				text = text.replace(/3./gi, "<br><br>3.");
				text = text.replace(/4./gi, "<br><br>4.");
				text = text.replace(/첫번째/gi, "<br><br>1.");
				text = text.replace(/두번재/gi, "<br><br>2.");
				text = text.replace(/세번째/gi, "<br><br>3.");
				text = text.replace(/네번째/gi, "<br><br>4.");
				text = text.replace(/예를 들어/gi, "<br><br>ex)");
				text = text.replace(/예로/gi, "<br><br>ex)");
				$('#textpaper').append('<p>' + text + '</p>');

			}

		});
		$.ajax({

			type : "POST",
			url : "/keywordshow",
			dataType : "json",
			data : {
				part : team
			},
			error : function() {
				alert('통신실패!!');
			},
			success : function(data) {
				$('#textpaper1 >p ').remove();
				var str="<p>";
				var j=1;
				for(i=0;i<data.length;i++){
					
					if(i==20*j){
						
						str+=data[i]+"<br>";
						j++;
					}else{
						str+=data[i]+", ";
					}
					
				}
				$('#textpaper1').append(str);
			}

		});
	}

	(function() {
		var cx = '018037253794668526436:tsneaaplxqu';
		var gcse = document.createElement('script');
		gcse.type = 'text/javascript';
		gcse.async = true;
		gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(gcse, s);
	})();
</script>
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
			<a class="navbar-brand" href="/Dashboard1">대시보드</a>
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
						<h1 class="page-header">
							대시보드 <small id="teamname"></small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i> Dashboard
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

										<div style="font-size: 32px" id="meeting1name">R&D</div>
									</div>
								</div>
							</div>
							<div class="panel-body" style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" id="meetinglist1">
									
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

										<div style="font-size: 32px" id="meeting2name">Softlayer</div>
									</div>
								</div>
							</div>
							<div class="panel-body" style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" id="meetinglist2" >
									
										
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

										<div style="font-size: 32px" id="meeting3name">Bluemix</div>
									</div>
								</div>
							</div>
							<div class="panel-body" style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" id="meetinglist3">
									
										
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

										<div style="font-size: 32px" id="meeting4name">테스트파트</div>
									</div>
								</div>
							</div>
							<div class="panel-body" style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" id="meetinglist4">
									
								</div>
								
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<h2>회의 참가인원</h2>
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
								<thead>
									<tr>
										<th>순서</th>
										<th>이름</th>
										<th>소속</th>
										<th>샘플</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>/index.html</td>
										<td>1265</td>
										<td>32.3%</td>
										<td>$321.33</td>
									</tr>
									<tr>
										<td>/about.html</td>
										<td>261</td>
										<td>33.3%</td>
										<td>$234.12</td>
									</tr>
									<tr>
										<td>/sales.html</td>
										<td>665</td>
										<td>21.3%</td>
										<td>$16.34</td>
									</tr>
									<tr>
										<td>/blog.html</td>
										<td>9516</td>
										<td>89.3%</td>
										<td>$1644.43</td>
									</tr>
									<tr>
										<td>/404.html</td>
										<td>23</td>
										<td>34.3%</td>
										<td>$23.52</td>
									</tr>
									<tr>
										<td>/services.html</td>
										<td>421</td>
										<td>60.3%</td>
										<td>$724.32</td>
									</tr>
									<tr>
										<td>/blog/post.html</td>
										<td>1233</td>
										<td>93.2%</td>
										<td>$126.34</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-bar-chart-o fa-fw"></i> 구조화 문서
							</h3>
						</div>
						<div class="panel-body">
							<div id="textpaper"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
<!-- row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-bar-chart-o fa-fw"></i> 구조화 흐름
							</h3>
						</div>
						<div class="panel-body">
							<div id="textpaper1"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-long-arrow-right fa-fw"></i>키워드 분석차트
							</h3>
						</div>
						<div class="panel-body">
							<div id="pie"></div>

						</div>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-money fa-fw"></i>세부 키워드
							</h3>
						</div>
						<div class="panel-body"
							style="max-height: 10; overflow-y: scroll; height: 550px;">
							<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped"
									id="keywordtable">
									<thead>
										<tr>
											<th>Order #</th>
											<th>키워드</th>
											<th>키워드 수</th>

										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
							<div class="text-right">
							
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-bar-chart-o fa-fw"></i> 키워드 뉴스보기
							</h3>
						</div>
						<div class="panel-body">
							<gcse:search></gcse:search>
						</div>





					</div>
				</div>
			</div>
		</div>
		<!-- row -->
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