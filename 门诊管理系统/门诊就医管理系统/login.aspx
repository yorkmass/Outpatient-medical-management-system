<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="baidu-site-verification" content="HGC2e45r3M" />
    <title>门诊就医管理系统</title>
    <meta charset="utf-8">
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
    <!-----start-main---->
	 <div class="main">
		<div class="login-form">
			<h1>Member Login</h1>
					<div class="head">
						<img src="images/user.png" alt=""/ >
					</div>
				<form id="form1" runat="server">
						<input type="text" id="username" runat="server" class="text" value="" placeholder="请输入用户名" onfocus="if (this.value =='') {this.placeholder ='' ;}"  onblur="if (this.value == '') {this.placeholder='请输入用户名';}" />
						<input  id="password" runat="server"  type="password" value=""  placeholder="请输入密码" onfocus="this.value = '';this.placeholder='';" onblur="if (this.value == '') {this.placeholder='请输入密码';this.value = '' ;}"/>
						<div class="submit">
							<div class="signin"><input type="submit" runat="server"  value="Login" />
					</div>	
					<p><a href="#">门诊就医管理系统</a></p>
				</form>
			</div>	
		</div>        	
</body>
</html>
