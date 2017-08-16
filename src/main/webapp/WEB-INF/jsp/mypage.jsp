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
<script
	src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script>
</head>
<script>
$( document ).ready(function() {
	
	$.ajax({
		type : "POST",
		url : "/teammeeting1",
		dataType:"json",
		error : function() {
			alert('통신실패!!');
		},
		success : function(data) {
			
			for(i=0;i<data.length;i++){
				
				var str="<button type='button' id="+data[i].meeting_id+">"+data[i].mt_name +" "+data[i].mt_date+"</button>";	
			
				if(data[i].mt_part=="RnD"){
				$('#meetinglist1').append(str);}
				else if(data[i].mt_part=="Softlayer"){
					$('#meetinglist2').append(str);
				}else if(data[i].mt_part=="Bluemix"){
					$('#meetinglist3').append(str);
				}else if(data[i].mt_part=="테스트파트"){
					$('#meetinglist4').append(str);
				}
				$('#'+data[i].meeting_id).attr("class",'list-group-item');
				$('#'+data[i].meeting_id).attr("onclick",'showdata('+"'"+data[i].meeting_id+"'"+')');
				str="";
			}
		
		}

	});
	});
	function showdata(id){
		$.ajax({
			type : "POST",
			url : "/showallsurvey",
			data:{meeting_id:id},
			dataType:"json",
			error : function() {
				alert('통신실패!!');
			},
			success : function(data) {
				$('#survey1 > p').remove();
				$('#survey2 > p').remove();
				$('#survey3 > p').remove();
				$('#survey4 > p').remove();
				$('#survey5 > p').remove();
				$('#'+id).attr("class",'list-group-item active');
				$('#surveybutton').attr("onclick","submitbutton('"+id+"')")
				var text="<p>"+"1. "+data[0]+"</p>";
					$('#survey1').append(text);
					text="<p>"+"2. "+data[1]+"</p>";
					$('#survey2').append(text);
					text="<p>"+"3. "+data[2]+"</p>";
					$('#survey3').append(text);
					text="<p>"+"4. "+data[3]+"</p>";
					$('#survey4').append(text);
					text="<p>"+"5. "+data[4]+"</p>";
					$('#survey5').append(text);
					$('#survey1 > p').attr("style","font-size:20px");
					$('#survey2 > p').attr("style","font-size:20px");
					$('#survey3 > p').attr("style","font-size:20px");
					$('#survey4 > p').attr("style","font-size:20px");
					$('#survey5 > p').attr("style","font-size:20px");
			}

		});
		
	}
	function submitbutton(id){
		$.ajax({
			type : "POST",
			url : "/insertsurvey",
			data:{meeting_id:id,
				score1:$('input:radio[name="radioGroup"]:checked').val(),
				score2:$('input:radio[name="radioGroup1"]:checked').val(),
				score3:$('input:radio[name="radioGroup2"]:checked').val(),
				score4:$('input:radio[name="radioGroup3"]:checked').val(),
				score5:$('input:radio[name="radioGroup4"]:checked').val()
				},
			dataType:"text",
			error : function() {
				alert('통신실패!!');
			},
			success : function(data) {
				if(data==1)
				alert("완료하였습니다.");
			}

		});
		
		
	}
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
						<h1 class="page-header">MyPage</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="/Dashboard1">Dashboard</a>
							</li>
							<li class="active"><i class="fa fa-bar-chart-o"></i> MyPage
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

										<div style="font-size: 32px" id="meeting2name">Softlayer</div>
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

										<div style="font-size: 32px" id="meeting3name">Bluemix</div>
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

										<div style="font-size: 32px" id="meeting4name">테스트파트</div>
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
									<i class="fa fa-long-arrow-right fa-fw"></i>설문조사지(1  매우안좋음 ~ 5  매우좋음)
								</h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<div id="survey1"></div>
									<label class="radio-inline"> <input type="radio"
										name="radioGroup" id="radio1" value="1"> 1
									</label> <label class="radio-inline"> <input type="radio"
										name="radioGroup" id="radio1" value="2"> 2
									</label> <label class="radio-inline"> <input type="radio"
										name="radioGroup" id="radio1" value="3"> 3
									</label> <label class="radio-inline"> <input type="radio"
										name="radioGroup" id="radio1" value="4"> 4
									</label> <label class="radio-inline"> <input type="radio"
										name="radioGroup" id="radio1" value="5"> 5
									</label>
								</div>
<div class="row">
								<div id="survey2"></div>
								<label class="radio-inline"> <input type="radio"
									name="radioGroup1" id="radio1" value="1"> 1
								</label> <label class="radio-inline"> <input type="radio"
									name="radioGroup1" id="radio2" value="2"> 2
								</label> <label class="radio-inline"> <input type="radio"
									name="radioGroup1" id="radio3" value="3"> 3
								</label> <label class="radio-inline"> <input type="radio"
									name="radioGroup1" id="radio4" value="4"> 4
								</label> <label class="radio-inline"> <input type="radio"
									name="radioGroup1" id="radio5" value="5"> 5
								</label>
							</div>
							<div class="row">
							<div id="survey3"></div>
							<label class="radio-inline"> <input type="radio"
								name="radioGroup2" id="radio1" value="1"> 1
							</label> <label class="radio-inline"> <input type="radio"
								name="radioGroup2" id="radio2" value="2"> 2
							</label> <label class="radio-inline"> <input type="radio"
								name="radioGroup2" id="radio3" value="3"> 3
							</label> <label class="radio-inline"> <input type="radio"
								name="radioGroup2" id="radio4" value="4"> 4
							</label> <label class="radio-inline"> <input type="radio"
								name="radioGroup2" id="radio5" value="5"> 5
							</label>
						</div>
						<div class="row">
						<div id="survey4"></div>
						<label class="radio-inline"> <input type="radio"
							name="radioGroup3" id="radio1" value="1"> 1
						</label> <label class="radio-inline"> <input type="radio"
							name="radioGroup3" id="radio2" value="2"> 2
						</label> <label class="radio-inline"> <input type="radio"
							name="radioGroup3" id="radio3" value="3"> 3
						</label> <label class="radio-inline"> <input type="radio"
							name="radioGroup3" id="radio4" value="4"> 4
						</label> <label class="radio-inline"> <input type="radio"
							name="radioGroup3" id="radio5" value="5"> 5
						</label>
					</div>
					<div class="row">
					<div id="survey5"></div>
					<label class="radio-inline"> <input type="radio"
						name="radioGroup4" id="radio1" value="1"> 1
					</label> <label class="radio-inline"> <input type="radio"
						name="radioGroup4" id="radio2" value="2"> 2
					</label> <label class="radio-inline"> <input type="radio"
						name="radioGroup4" id="radio3" value="3"> 3
					</label> <label class="radio-inline"> <input type="radio"
						name="radioGroup4" id="radio4" value="4"> 4
					</label> <label class="radio-inline"> <input type="radio"
						name="radioGroup4" id="radio5" value="5"> 5
					</label>
				</div>
			</div>
		</div>
<button type="button" id="surveybutton" class="btn btn-default">설문작성완료</button>

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


</body>




</html>