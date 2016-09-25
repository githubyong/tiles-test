<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.5/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.5/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.5/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <title>设备管理系统</title>
    <style type="text/css">

        .logo1 {
            vertical-align: middle;
            margin-left: 14%;
        }

        .logo2 {
            vertical-align: middle;
            margin-left: 24px;
            margin-top: 8px;
        }

        #heading {
            display: inline-block;
            background: #F8F8F8;
            width: 100%;
            height: 8%;
            padding-top: 12px;
        }

        #center {
            height: 82%;
            background: url("${pageContext.request.contextPath}/static/images/login-bg.png") no-repeat;
            background-size: 100% 100%;
        }

        #footer {
            padding-top: 20px;
            text-align: center;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        #login-module {
            position: absolute;
            margin-top: 180px;
            right: 160px;
            margin-bottom: 10px;
            background-color: #fff;
            min-width: 310px;
            min-height: 320px;
            background: #F8F8F8;
            z-index: 2;
        }

        .form-control {
            padding-left: 32px !important;
            width: 268px;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
        }

        .pre {
            position: absolute;
            z-index: 2;
            padding: 6px 0 0 8px;
        }
        .loginbtn{
            margin-top: 20px;
            width: 268px;
            height: 32px;
            background: #53C7A0;
            border: none;
        }
    </style>
</head>
<body>

<div id="heading">
    <img src="${pageContext.request.contextPath}/static/images/login-logo.png" alt="logo1" width="58"
         height="51"
         class="logo1"/>
    <img src="${pageContext.request.contextPath}/static/images/login-logo2.png" alt="logo2"
         class="logo2"/>
</div>
<div id="center">
    <div id="login-module">
        <div style="font-size: 18px;font-family: '微软雅黑';color: #53C7A0;margin: 8px 18px 4px 18px;border-bottom:1px solid #D4D4D4;padding-bottom: 8px; ">
            <span>登录</span>
        </div>
        <form name="loginForm" id="loginForm" method="post" onsubmit="return checkLoginForm();">
            <div style="text-align:center;margin-top: 40px;">
                <img src="${pageContext.request.contextPath}/static/images/user.png" class="pre"/>
                <input type="text" name="username" class="form-control user" placeholder="用户名" required>
            </div>
            <div style="text-align: center;margin-top: 40px;">
                <img src="${pageContext.request.contextPath}/static/images/pwd.png" class="pre"/>
                <input type="password" name="password" class="form-control pwd" placeholder="密码" required>
            </div>
            <div style="text-align: left;margin-left: 28px;margin-top: 8px;">
                <span class="err">密码错误</span>
            </div>
            <div style="text-align:center;height: 30px">
               <input type="submit" class="loginbtn" value="登录"/></p>
            </div>
        </form>
    </div>
</div>
<div id="footer">
    <span>  Copyright © NEC中国研究院</span>
</div>
</body>
</html>
