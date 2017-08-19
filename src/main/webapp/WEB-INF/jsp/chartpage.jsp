<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>대시보드</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Morris Charts CSS -->

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script>
</head>
<script>
$( document ).ready(function() {
	
	$.ajax({
		type : "POST",
		url : "/teammeeting",
		dataType:"json",
		error : function() {
			
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
				//$('#'+i).attr("onclick",'showdata('+"'"+data[i].meeting_id+"'"+')');
				str="";
			}
		
		}

	});
	});
</script>
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
				<li><a href="/mypage"><i class="fa fa-fw fa-table"></i>
						Mypage</a></li>
				<li><a href="/enrollform"><i class="fa fa-fw fa-edit"></i>
						설문작성</a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse --> </nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">차트</h1>
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

										<div style="font-size: 32px" id="meeting1name">통신</div>
									</div>
								</div>
							</div>
							<div class="panel-body"
								style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" id="meetinglist1"></div>

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

										<div style="font-size: 32px" id="meeting2name">제조</div>
									</div>
								</div>
							</div>
							<div class="panel-body"
								style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" id="meetinglist2"></div>

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

										<div style="font-size: 32px" id="meeting3name">물류</div>
									</div>
								</div>
							</div>
							<div class="panel-body"
								style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" id="meetinglist3"></div>

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

										<div style="font-size: 32px" id="meeting4name">VDI</div>
									</div>
								</div>
							</div>
							<div class="panel-body"
								style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" id="meetinglist4"></div>

							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right fa-fw"></i>월회의수
								</h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6 text-left">
										<canvas id="myChart" width="1000" height="300"></canvas>
									</div>
									<div class="col-md-6 text-right">
										<select id="job" class="selectpicker">
											<option value="">년월</option>
											<option value="1">17/01</option>
											<option value="2">17/02</option>
											<option value="3">17/03</option>
											<option value="4">17/04</option>
											<option value="5">17/05</option>
											<option value="6">17/06</option>
											<option value="7">17/07</option>
											<option value="8">17/08</option>
											<option value="9">17/09</option>
											<option value="10">17/10</option>
											<option value="11">17/11</option>
											<option value="12">17/12</option>

										</select>
										<button id="histclick" class="btn-success" value="보기">보기</button>
									</div>
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
									<i class="fa fa-long-arrow-right"></i> 통신
								</h3>
							</div>
							<div class="panel-body">
								<div id="pie1"></div>
								
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i> 제조
								</h3>
							</div>
							<div class="panel-body">
								<div id="pie"></div>
								
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i> 물류
								</h3>
							</div>
							<div class="panel-body">
								<div id="pie3"></div>
								
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i>VDI
								</h3>
							</div>
							<div class="panel-body">
								<div id="pie4"></div>
								
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
<div class="row">
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i>팀 총 키워드
								</h3>
							</div>
							<div class="panel-body">
								<div id="pie5"></div>
								
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-long-arrow-right"></i>연간 팀 총 키워드
								</h3>
							</div>
							<div class="panel-body">
								<div id="pie6"></div>
								
							</div>
						</div>
					</div>
					</div>



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


</body>

<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="/js/d3.min.js"  charset="utf-8"></script>
<script src="/js/d3pie.js"></script>


<script>
$("#histclick").click(function(){
	var str="17/0"+($("#job").val());
	var str1="17/0"+(Number($("#job").val())+1).toString();
	$('svg').remove();
	histogram(str,str1);
	$.ajax({

		type : "POST",
		url : "/monthpart2show",
		dataType : "json",
		data : {
			part : '물류',
			start: str,
			end:str1
			
		},
		error : function() {
			
		},
		success : function(data) {
			
			var pie = new d3pie("pie", {
				header : {
					title : {
						text : "물류 월간 키워드"
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
		url : "/monthpart1show",
		dataType : "json",
		data : {
			part : '통신',
			start: str,
			end:str1
			
		},
		error : function() {
			
		},
		success : function(data) {
			
			var pie = new d3pie("pie1", {
				header : {
					title : {
						text : "통신 월관 키워드"
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
		url : "/monthpart3show",
		dataType : "json",
		data : {
			part : '제조',
			start: str,
			end:str1
			
		},
		error : function() {
			
		},
		success : function(data) {
			
			var pie = new d3pie("pie3", {
				header : {
					title : {
						text : "제조 월관 키워드"
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
		url : "/monthpart4show",
		dataType : "json",
		data : {
			part : 'VDI',
			start: str,
			end:str1
			
		},
		error : function() {
			
		},
		success : function(data) {
			
			var pie = new d3pie("pie4", {
				header : {
					title : {
						text : "VDI 월관 키워드"
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
		url : "/monthall",
		dataType : "json",
		data : {
			
			start: str,
			end:str1
			
		},
		error : function() {
			
		},
		success : function(data) {
			
			var pie = new d3pie("pie5", {
				header : {
					title : {
						text : "월간 팀 키워드"
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
		url : "/yearall",
		dataType : "json",
		data : {
			
	
			
		},
		error : function() {
			
		},
		success : function(data) {
			
			var pie = new d3pie("pie6", {
				header : {
					title : {
						text : "연간 팀 키워드"
					}
				},
				data : {
					content : data

				}
			});
		}

	});
	
});
</script>

<script>
function histogram( str, str1){
	$.ajax({

		type : "POST",
		url : "/teammonth",
		dataType : "json",
		data : {
			
			start: str,
			end: str1
			
		},
		error : function() {
			
		},
		success : function(data) {
			var data2 = {
					labels: ["Bluemix", "테스트파트", "Softlayer", "RnD"],
					datasets: [
						{
							label: "My First dataset",
							fillColor: "rgba(150,200,250,0.5)",
							strokeColor: "rgba(150,200,250,0.8)",
							highlightFill: "rgba(150,200,250,0.75)",
							highlightStroke: "rgba(150,200,250,1)",
							data: data
						}
					]
				};
				var options = {	animation: false };
				var steps = 3;
				var ctx = $('#myChart').get(0).getContext('2d');
				var myBarChart = new Chart(ctx).Bar(data2, {
				    scaleOverride: true,
				    scaleSteps: steps,
				    scaleStepWidth: Math.ceil(6 / steps),
				    scaleStartValue: 0
				});
		}
		});
	
}
</script>

</html>