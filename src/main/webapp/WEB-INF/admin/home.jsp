<%@page language="java" contentType="text/html;charset=utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>首页 - 光年(Light Year Admin)后台管理系统模板</title>
    <link rel="icon" href="${base}/WEB-INF/admin/favicon.ico" type="image/ico">
    <meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
    <meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
    <meta name="author" content="yinqi">
    <link href="${base}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${base}/css/style.min.css" rel="stylesheet">
</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <a href="${base}/toIndex"><img src="${base}/images/logo-sidebar.png" title="LightYear" alt="LightYear"/></a>
            </div>
            <div class="lyear-layout-sidebar-scroll">
                <!--功能菜单栏开始 每个ul为一个答菜单-->
                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-format-align-justify"></i> 系统管理</a>
                            <ul class="nav nav-subnav">
                                <li><a href="javascript:void(0)" _href="${base}/user/show">用户管理</a></li>
                                <li><a href="javascript:void(0)" _href="${base}/role/show">角色管理</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>

        </aside>
        <!--End 左侧导航-->

        <!--头部信息-->
        <header class="lyear-layout-header">

            <nav class="navbar navbar-default">
                <div class="topbar">

                    <div class="topbar-left">
                        <div class="lyear-aside-toggler">
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                        </div>
                        <span class="navbar-page-title"> 后台首页 </span>
                    </div>
                    <div>当前用户：${user.name}</div>

                </div>
            </nav>

        </header>
        <!--End 头部信息-->

        <!--页面主要内容-->
        <main class="lyear-layout-content">
            <iframe src="${base}/toIndex" id="main" frameborder="0" style="width: 100%;"></iframe>
        </main>
        <!--End 页面主要内容-->
    </div>
</div>

<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/js/main.min.js"></script>
<!--iframe自适应高度-->
<script>
    /*a标签点击跳转*/
    $("a").click(function () {
        var href = $(this).attr("_href");
        if (href != null && href != "") {
            $("#main").attr("src", href);
        }
    });

    var iframe = document.getElementById("main");

    function getClientHeight() {
        var clientHeight = 0;
        if (document.body.clientHeight && document.documentElement.clientHeight) {
            var clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
        } else {
            var clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
        }
        return clientHeight;
    }

    iframe.setAttribute("height", getClientHeight() - 75);


    //    iframe.onload = function() {
    //        iframe.contentWindow.onbeforeunload = function() {
    //            iframe.style.visibility = 'hidden';
    //            // iframes[_i].style.display = 'none';
    //
    //            iframe.setAttribute('height', 'auto');
    //        };
    //
    //        iframe.setAttribute('height', this.contentWindow.document.body.scrollHeight);
    //
    //        iframe.style.visibility = 'visible';
    //        // this.style.display = 'block';
    //    }
</script>
</body>
</html>