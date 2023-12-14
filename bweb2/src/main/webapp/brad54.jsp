<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>AddNew</h1>
		<hr />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script>
			function checkAccount(){
				$("#mesg").load("checkAccount.jsp?account=" + $("#account").val());
			}
			function checkData(){
				add();
			}
			function add(){
				$.post("brad55.jsp",
						{
							account: $('#account').val(),
							passwd: $('#passwd').val(),
							cname: $('#cname').val(),
						},
						function(data, status){
							if (status == 'success'){
								console.log('ajax success:' + data);
								if (data.trim() != '0'){
									window.location.href = 'main.jsp';	
								}else{
									
								}
							}
						});
			}
		</script>		
		
		Account: <input id="account" onblur="checkAccount()" /><span id="mesg"></span><br />
		Password: <input type="password" id="passwd"/><br />
		Name: <input id="cname" /><br />
		<input type="button" onclick="checkData()" value="Add" />
				
	</body>
</html>