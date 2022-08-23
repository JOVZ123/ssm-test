<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>注册</title>
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

                    <form action="${base}/user/update" method="post" enctype="multipart/form-data" class="row">
                        <input style="display: none" name="id" id="id" value="${selectById.id}">
                        <div class="form-group col-md-12">
                            <label for="role">角色</label>
                            <div class="form-controls">
                                <select class="form-control" id="example-select" name="roleid" size="1">
                                    <option>请选择</option>
                                    <c:forEach var="r" items="${roleList}">
                                        <option value="${r.id}">${r.reloname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="name">用户名</label>
                            <div class="form-controls">
                                <input type="text" class="form-control" id="name" name="name" value="${selectById.name}"
                                       placeholder="请输入用户名"/>
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="seo_keywords">密码</label>
                            <input type="text" class="form-control" id="password" name="password"
                                   value="${selectById.password}" placeholder="密码"/>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="seo_keywords">确认密码</label>
                            <input type="text" class="form-control" id="seo_keywords" name="re_password"
                                   value="${selectById.password}" placeholder="确认密码"/>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="phone">手机</label>
                            <input class="form-control" id="phone" name="phone" value="${selectById.phone}"
                                   placeholder="手机号"></input>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="status">状态</label>
                            <div class="clearfix">
                                <label class="lyear-radio radio-inline radio-primary">
                                    <input type="radio" name="status"
                                           <c:if test="${selectById.status eq 1}">checked</c:if>
                                           value="1"><span>禁用</span>
                                </label>
                                <label class="lyear-radio radio-inline radio-primary">
                                    <input type="radio" name="status"
                                           <c:if test="${selectById.status eq 0}">checked</c:if>
                                           value="0"><span>启用</span>
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
<script>
    function cli() {
        //获取文件组件触发单击事件
        document.getElementById("myHead").click();
    }

    function show(obj) {
        var imgFile = obj.files[0];
        var src = window.URL.createObjectURL(imgFile);
        document.getElementById("img").setAttribute("src", src);
    }
</script>