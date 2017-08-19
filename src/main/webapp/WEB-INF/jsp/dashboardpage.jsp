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
<script
	src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<script src="/js/d3pie.js"></script>

<script>
	$(document).ready(
			function() {

				$.ajax({
					type : "POST",
					url : "/teammeeting",
					dataType : "json",
					error : function() {

					},
					success : function(data) {

						for (i = 0; i < data.length; i++) {

							var str = "<button type='button' id="+i+">"
									+ data[i].mt_name + " " + data[i].mt_date
									+ "</button>";

							if (data[i].mt_part == "통신") {
								$('#meetinglist1').append(str);
							} else if (data[i].mt_part == "제조") {
								$('#meetinglist2').append(str);
							} else if (data[i].mt_part == "물류") {
								$('#meetinglist3').append(str);
							} else if (data[i].mt_part == "QA") {
								$('#meetinglist4').append(str);
							}
							$('#' + i).attr("class", 'list-group-item');
							$('#' + i).attr(
									"onclick",
									'showdata(' + "'" + data[i].meeting_id
											+ "'" + ')');
							str = "";
						}

					}

				});
			});
	function showdata(team) {
		alert("완료가 될때까지 기다려주세요.");

		$.ajax({

			type : "POST",
			url : "/detailpietextword",
			dataType : "json",
			data : {
				part : team
			},
			error : function() {

			},
			success : function(data) {
				$('svg').remove();
				var pie = new d3pie("pie", {
					header : {
						title : {
							text : "분석 차트"
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

			},
			success : function(text) {
				$('#textpaper >p ').remove();
				text = text.replace(/첫번째/gi, "<br><br>1.");
				text = text.replace(/두번째/gi, "<br><br>2.");
				text = text.replace(/세번째/gi, "<br><br>3.");
				text = text.replace(/네번째/gi, "<br><br>4.");
				text = text.replace(/첫 번째/gi, "<br><br>1.");
				text = text.replace(/두 번째/gi, "<br><br>2.");
				text = text.replace(/세 번째/gi, "<br><br>3.");
				text = text.replace(/네 번째/gi, "<br><br>4.");
				text = text.replace(/예를 들어/gi, "<br><br>ex)");
				text = text.replace(/예로/gi, "<br><br>ex)");
				text = text.replace(/참고로/gi, "<br><br>cf)");
				text = text.replace(/하지만/gi, "<br><br>하지만,");
				text = text.replace(/마지막으로/gi, "<br><br>마지막으로,");
				text = text.replace(/결론적으로/gi, "<br><br>결론적으로");
				text = text.replace(/중요한것은/gi, "<br><br>ex)");
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

			},
			success : function(data) {
				$('#textpaper1 >p ').remove();
				var str = "<p>";
				var j = 1;
				for (i = 0; i < data.length; i++) {

					if (i == 20 * j) {

						str += data[i] + "<br>";
						j++;
					} else {
						str += data[i] + ", ";
					}

				}
				$('#textpaper1').append(str);
			}

		});
		$.ajax({

			type : "POST",
			url : "/usermeetinglist",
			dataType : "json",
			data : {
				part : team
			},
			error : function() {

			},
			success : function(data) {
				$('#usermeeting >tbody>tr').remove();
				var str = "";
				var j = 1;
				for (i = 0; i < data.length; i++) {
					str += "<tr>";
					str += "<td>" + data[i].user_name + "</td><td>"
							+ data[i].user_position + "</td><td>"
							+ data[i].user_email + "</td>"
					str += "</tr>";
				}

				$('#usermeeting>tbody').append(str);
			}

		});

		$
				.ajax({

					type : "POST",
					url : "/similarity",
					dataType : "json",
					data : {
						part : team
					},
					error : function() {

					},
					success : function(data) {

						$('#association > button').remove();
						for (i = 0; i < data.length; i++) {
							var str = "<button type='button' id=k"+i+">"
									+ data[i].mt_name + " " + data[i].mt_date
									+ "</button>";
							$('#association').append(str);
							$('#k' + i).attr("class", 'list-group-item');
							$('#k' + i).attr(
									"onclick",
									'showdata(' + "'" + data[i].meeting_id
											+ "'" + ')');
							str = "";

						}
						
					}

				});
		$.ajax({

			type : "POST",
			url : "/showsurveyid",
			dataType : "json",
			data : {
				part : team
			},
			error : function() {

			},
			success : function(data) {
				$('#usersurvey >tbody>tr').remove();
				var str = "";
				var j = 1;
				for (i = 0; i < data.length; i++) {
					str += "<tr>";
					str += "<td>" + data[i].score1 + "</td><td>"
							+ data[i].score2 + "</td><td>" + data[i].score3
							+ "</td><td>" + data[i].score4 + "</td><td>"
							+ data[i].score5 + "</td>";

					str += "</tr>";
				}

				$('#usersurvey>tbody').append(str);
			}

		});

		$.ajax({

			type : "POST",
			url : "/surveypoint",
			dataType : "json",
			data : {

				part : team

			},
			error : function() {

			},
			success : function(data) {
				var data2 = {
					labels : [ "1번", "2번", "3번", "4번", "5번" ],
					datasets : [ {
						label : "My First dataset",
						fillColor : "rgba(150,200,250,0.5)",
						strokeColor : "rgba(150,200,250,0.8)",
						highlightFill : "rgba(150,200,250,0.75)",
						highlightStroke : "rgba(150,200,250,1)",
						data : data
					} ]
				};
				var options = {
					animation : false
				};
				var steps = 3;
				var ctx = $('#myChart1').get(0).getContext('2d');
				var myBarChart = new Chart(ctx).Bar(data2, {
					scaleOverride : true,
					scaleSteps : steps,
					scaleStepWidth : Math.ceil(6 / steps),
					scaleStartValue : 0
				});
			}
		});

		$.ajax({

			type : "POST",
			url : "/showallsurvey",
			dataType : "json",
			data : {

				meeting_id : team

			},
			error : function() {

			},
			success : function(data) {
				$('#surveyindex > p').remove();

				var text = "<p>" + "1. " + data[0] + "</p><br>" + "<p>" + "2. "
						+ data[1] + "</p><br>" + "<p>" + "3. " + data[2]
						+ "</p><br>" + "<p>" + "4. " + data[3] + "</p><br>"
						+ "<p>" + "5. " + data[4] + "</p>";
				$('#surveyindex').append(text);
				$('#surveyindex > p').attr("style", "font-size:20px");

			}
		});
		$.ajax({

			type : "POST",
			url : "/emotionshow",
			dataType : "json",
			data : {
				part : team
			},
			error : function() {

			},
			success : function(data) {
				$('#assoindex >p ').remove();
				$('#emotion > p').remove();
				var str = "";

				for (i = 0; i < data.concepts.length; i++) {
					str += "<p>" + "연관 주제: " + data.concepts[i].text
							+ "  | 연관율: " + (data.concepts[i].relevance * 100)
							+ "%</p><br>";
				}
				$('#assoindex').append(str);
				if (data.sentiment.document.score > 0) {
					$('#emotion').append("<p>긍정</p>");
					$('#emotion > p').attr("style",
							"font-size:20px; color:blue");
				} else if (data.sentimetn.document.score = 0) {
					$('#emotion').append("<p>중립</p>");
					$('#emotion > p').attr("style",
							"font-size:20px;color:yellow");
				} else {
					$('#emotion').append("<p>부정</p>");
					$('#emotion > p')
							.attr("style", "font-size:20px; color:red");
				}
				$('#assoindex >p').attr("style", "font-size:20px;");
			}

		});
		$.ajax({

			type : "POST",
			url : "/assokeyword",
			dataType : "json",
			data : {
				meeting_id : team
			},
			error : function() {

			},
			success : function(data) {
				$('#assokeywordtable >tbody>tr').remove();
				$('#assokeywordtable1 >tbody>tr').remove();
				$('#assokeywordtable2 >tbody>tr').remove();
				
				var str="";
				var str1="";
				var str2="";
				for(i=0;i<data.length;i++){
					if(i==1)
					str1+="<tr>";
					for(j=0;j<data[i].length;j++){
						if(i==0)
						str+="<tr>";
						else if(i==1)
							str1+="<td>"+data[i][j]+"</td>";
						else if(i==2)
						str2+="<tr>";
						for(k=0;k<data[i][j].length;k++){
							
							if(i==0){
								str+="<td>"+data[i][j][k]+"</td>";
								
							}else if(i==1){
								
							}else if(i==2){
								str2+="<td>"+data[i][j][k]+"</td>";
							}
						}
						if(i==0)
						str+="</tr>";
						
						else if(i==2)
						str2+="</tr>";
					}
					if(i==1)
						str1+="</tr>";
				}
			
				$('#assokeywordtable>tbody').append(str);
				$('#assokeywordtable1>tbody').append(str1);
				$('#assokeywordtable2>tbody').append(str2);
				alert("완료되었습니다!");
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
										<strong>${sessionScope.user_id}</strong>
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
										<strong>${sessionScope.user_id}</strong>
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
										<strong>${sessionScope.user_id}</strong>
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
				data-toggle="dropdown"><i class="fa fa-user"></i>${sessionScope.user_id}
					<b class="caret"></b></a>
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
										<i class="fa fa-tasks fa-5x"></i>
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
										<i class="fa fa-tasks fa-5x"></i>
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
										<i class="fa fa-support fa-5x"></i>
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
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-6">
						<h2>회의 참가인원</h2>
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped"
								id="usermeeting">
								<thead>
									<tr>

										<th>이름</th>
										<th>소속</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-bar-chart-o fa-fw"></i> 연관 회의
								</h3>
							</div>
							<div class="panel-body"
								style="max-height: 10; overflow-y: scroll; height: 250px;">
								<div class="list-group" id="association"></div>

							</div>
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
								<i class="fa fa-bar-chart-o fa-fw"></i> 키워드 흐름
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
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-long-arrow-right fa-fw"></i>카테고리분석
							</h3>
						</div>
						<div class="panel-body" style="max-height: 10; overflow-y: scroll; height: 150px;">
							<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped"
									id="assokeywordtable1">
									<thead>
										<tr>
											
											<th>CATEGORY</th>
											<th>RELEVANCE</th>
											
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-long-arrow-right fa-fw"></i>컨셉 분석
							</h3>
						</div>
						<div class="panel-body" style="max-height: 10; overflow-y: scroll; height: 150px;">
							<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped"
									id="assokeywordtable2">
									<thead>
										<tr>
											
											<th>CONCEPT</th>
											<th>RELEVANCE</th>
											
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
				</div>
				<!-- row -->
			<div class="row">
				<div class="col-lg-7">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-long-arrow-right fa-fw"></i>빈도수 기반 키워드 분석차트
							</h3>
						</div>
						<div class="panel-body">
							<div id="pie"></div>

						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-long-arrow-right fa-fw"></i>에이브릴 분석
							</h3>
						</div>
						<div class="panel-body" style="max-height: 10; overflow-y: scroll; height: 550px;">
							<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped"
									id="assokeywordtable">
									<thead>
										<tr>
											
											<th>KEYWORD</th>
											<th>RELEVANCE</th>
											<th>SENTIMENT</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
				<!--  <div class="col-lg-4">
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
							<div class="text-right"></div>
						</div>
					</div>
				</div>-->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-6">
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

				<div class="col-lg-6">
					<h2>설문 점수</h2>
					<div class="table-responsive">
						<table class="table table-bordered table-hover table-striped"
							id="usersurvey">
							<thead>
								<tr>

									<th>점수1</th>
									<th>점수2</th>
									<th>점수3</th>
									<th>점수4</th>
									<th>점수5</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-long-arrow-right fa-fw"></i>설문평균점수
							</h3>
						</div>
						<div class="panel-body">
							<div class="row">

								<canvas id="myChart1" width="500" height="300"></canvas>


							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-long-arrow-right fa-fw"></i>설문목록
							</h3>
						</div>
						<div class="panel-body">
							<div id="surveyindex"></div>
						</div>
					</div>
				</div>

			</div>
			<!--  <div class="row">
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-long-arrow-right fa-fw"></i>감정상태
							</h3>
						</div>
						<div class="panel-body">
							<div id="emotion"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-long-arrow-right fa-fw"></i>연관 주제
							</h3>
						</div>
						<div class="panel-body">
							<div id="assoindex"></div>
						</div>
					</div>
				</div>

			</div>-->
			<!-- row -->
		</div>

		<!-- row -->

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