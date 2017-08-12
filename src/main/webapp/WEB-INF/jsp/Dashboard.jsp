<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="/js/d3.min.js" charset="utf-8"></script>
<script src="http://www.google.com/uds/api?file=uds.js&v=1.0&source=uds-nbw&key=ABQIAAAApOoAVBbMKiUJNvjHtxLAORSnTW6hP3UBQ_UU2Os-AZS5MZQfghSdUK5p2HNHNKLREUvBOWU2Vvif8w"
    type="text/javascript"></script>
<style type="text/css">
    @import url("http://www.google.com/uds/css/gsearch.css");
  </style>

<script src="/js/d3pie.js"></script>
<script>

function showdata(team){
	$.ajax({
	    
	    type : "POST",
	    url : "/detailpietextword",
	    dataType : "json",
	    data:{part:team},
	    error : function(){
	        alert('통신실패!!');
	    },
	    success : function(data){
	    alert(data);
	   
		
	    	var pie = new d3pie("pie", {
	    		header: {
	    			title: {
	    				text: team
	    			}
	    		},
	    		data: {
	    			content: 
	    				data
	    				
	    		}
	    	});
	    }
	     
	});

}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	padding: 5%;
}

.panel-heading {
	font-size: 20px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: steelblue">인프라</div>
				<div class="panel-body"><input type="button"  value="인프라" onclick="showdata('인프라')"></div>

			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default" >
				<div class="panel-heading" style="background-color: steelblue">빅데이터</div>
				<div class="panel-body"><input type="button" id="bigdatateam" value="빅데이터" onclick="showdata('빅데이터')"></div>

			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: steelblue">G2</div>
				<div class="panel-body">Bootstrap Panel Body</div>

			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: steelblue">CMS</div>
				<div class="panel-body">Bootstrap Panel Body</div>

			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: steelblue">Bootstrap
					Panel Heading</div>
				<div class="panel-body">Bootstrap Panel Body</div>

			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: steelblue">Bootstrap
					Panel Heading</div>
				<div class="panel-body">Bootstrap Panel Body</div>

			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-8">
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: red;">데이터
					분석</div>
				<div class="panel-body">
				
				<div id="pie"></div>
				</div>

			</div>

		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">관련 키워드기사</div>
				<div class="panel-body"></div>

			</div>

		</div>
	</div>
</body>
<script>

</script>
</html>