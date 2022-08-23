<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>新增文档 - 光年(Light Year Admin)后台管理系统模板</title>
    <link rel="icon" href="../favicon.ico" type="image/ico">
    <meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
    <meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
    <meta name="author" content="yinqi">
    <link href="${base}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/materialdesignicons.min.css" rel="stylesheet">
    <!--标签插件-->
    <link rel="stylesheet" href="${base}/js/jquery-tags-input/jquery.tagsinput.min.css">
    <link href="${base}/css/style.min.css" rel="stylesheet">
</head>

<body>
<div class="container-fluid">

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                    <form action="${base}/role/add" method="post" class="row">
                        <div class="form-group col-md-12">
                            <label for="name">角色名</label>
                            <input type="text" class="form-control" id="name" name="reloname" value=""
                                   placeholder="角色名"/>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="status">状态</label>
                            <div class="clearfix">
                                <label class="lyear-radio radio-inline radio-primary">
                                    <input type="radio" name="status" value="1"><span>禁用</span>
                                </label>
                                <label class="lyear-radio radio-inline radio-primary">
                                    <input type="radio" name="status" value="0" checked><span>启用</span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <button type="submit" class="btn btn-primary ajax-post" target-form="add-form">确 定</button>
                            <button type="button" class="btn btn-default"
                                    onclick="javascript:history.back(-1);return false;">返 回
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

    </div>

</div>

<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/perfect-scrollbar.min.js"></script>
<!--标签插件-->
<script src="${base}/js/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="${base}/js/main.min.js"></script>
</body>
</html>