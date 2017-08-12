<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="pie"></div>
</body>
<script src="/js/d3.min.js"  charset="utf-8"></script>

 <script src="/js/d3pie.js"></script>
<script>
var pie = new d3pie("pie", {
	header: {
		title: {
			text: "파이형"
		}
	},
	data: {
		content: [
			{ label: "JavaScript", value: 264131 },
			{ label: "Ruby", value: 218812 },
			{ label: "Java", value: 157618},
		]
	}
});
</script>

</html>