<%@page contentType="text/html;charset=utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>错误页面 - 光年(Light Year Admin)后台管理系统模板</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
    <meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
    <meta name="author" content="yinqi">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fff;
        }

        .error-page {
            height: 100%;
            position: fixed;
            justify-content: center;
            width: 100%;
        }

        .error-body {
            padding-top: 5%;
            padding-left: 30%;
        }

        .error-body h2 {
            font-size: 70px;
            font-weight: 700;
            text-shadow: 4px 4px 0 #f5f6fa, 6px 6px 0 #33cabb;
            line-height: 70px;
            color: #33cabb;

        }

        .error-body h4 {
            margin: 30px 0px;
        }

        a {
            text-decoration: none;
            color: #4c4c4c;
        }
    </style>
</head>

<body>
<section class="error-page">
    <div class="error-box">
        <div class="error-body text-center">
            <h2>无访问权限</h2>
            <h4>您没有资格访问,请和管理员联系。</h4>
            <a href="${base}/toLogin" class="btn btn-primary ">返回登录</a>
        </div>
    </div>
</section>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">;</script>
</body>
</html>