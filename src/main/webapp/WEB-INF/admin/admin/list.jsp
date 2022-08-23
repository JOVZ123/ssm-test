<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>文档列表 - 光年(Light Year Admin)后台管理系统模板</title>
    <link rel="icon" href="../favicon.ico" type="image/ico">
    <meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
    <meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
    <meta name="author" content="yinqi">
    <link href="${base}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${base}/css/style.min.css" rel="stylesheet">
</head>
<style>
    img {
        display: inline-block;
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }
</style>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <%--      <form method="post" action="${base}/admin/delete" id="del">--%>
            <div class="card">
                <div class="card-toolbar clearfix">
                    <form class="pull-right search-bar" method="get" action="${base}/user/show" role="form">
                        <div class="input-group">
                            <div class="input-group-btn">
                                <input type="hidden" name="search_field" id="search-field" value="title">
                            </div>
                            <input type="text" class="form-control" value="${search}" name="search" placeholder="请输入名称">
                        </div>
                    </form>
                    <div class="toolbar-btn-action">
                        <a class="btn btn-primary m-r-5" href="${base}/user/toAdd"><i class="mdi mdi-plus"></i> 新增</a>
                        <a class="btn btn-success m-r-5" onclick="opens()"><i class="mdi mdi-check"></i> 启用</a>
                        <a class="btn btn-warning m-r-5" onclick="disable()"><i class="mdi mdi-block-helper"></i> 禁用</a>
                        <a class="btn btn-danger" onclick="del()" href="#!"><i class="mdi mdi-window-close"></i> 删除</a>
                    </div>
                </div>
                <div class="card-body">

                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>
                                    <label class="lyear-checkbox checkbox-primary">
                                        <input type="checkbox" id="check-all"><span></span>
                                    </label>
                                </th>
                                <th>编号</th>
                                <th>账号</th>
                                <th>用户名</th>
                                <th>手机</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="a" items="${p.list}">
                                <tr>
                                    <td>
                                        <label class="lyear-checkbox checkbox-primary">
                                            <input type="checkbox" name="id" value="${a.id}"><span></span>
                                        </label>
                                    </td>
                                    <td>${a.id}</td>
                                    <td>${a.account}</td>
                                    <td>${a.name}</td>
                                    <td>${a.phone}</td>
                                    <td>
                                        <c:if test="${a.status eq 0}"><font class="text-success">正常</font></c:if>
                                        <c:if test="${a.status eq 1}"><font class="text-danger">禁用</font></c:if>
                                    </td>
                                    <td>
                                        <div class="btn-group">
                                            <a class="btn btn-xs btn-default" href="${base}/user/toUpdate?id=${a.id}"
                                               title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
                                            <c:if test="${user.id != a.id}"><a class="btn btn-xs btn-default"
                                                                               href="${base}/user/delete?ids=${a.id}"
                                                                               onclick="return confirm('是否删除')"
                                                                               title="删除" data-toggle="tooltip"><i
                                                    class="mdi mdi-window-close"></i></a></c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <ul class="pagination">
                        <li><span><a href="${base}/user/show?pageNum=${p.prePage}">«</a></span></li>
                        <c:forEach var="n" items="${p.navigatepageNums}">
                            <li <c:if test="${n eq p.pageNum}">class="active"</c:if>><a
                                    href="${base}/user/show?pageNum=${n}">${n}</a></li>
                        </c:forEach>
                        <li><span><a href="${base}/user/show?pageNum=${p.nextPage}">»</a></span></li>
                    </ul>

                </div>
            </div>
            <%--      </form>--%>
        </div>

    </div>

</div>

<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/js/main.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('.search-bar .dropdown-menu a').click(function () {
            var field = $(this).data('field') || '';
            $('#search-field').val(field);
            $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
        });
    });

    function del() {
        if (confirm('是否删除')) {
            var id = "";
            var ids = document.getElementsByName("id");
            for (var i = 0; i < ids.length; i++) {
                if (ids[i].checked == true) {
                    id += ids[i].value + ",";
                }
            }
            location.href = "${base}/user/delete?ids=" + id;
        } else {
            return false;
        }
    }

    function opens() {
        if (confirm('是否启用')) {
            var id = "";
            var ids = document.getElementsByName("id");
            for (var i = 0; i < ids.length; i++) {
                if (ids[i].checked == true) {
                    id += ids[i].value + ",";
                }
            }
            location.href = "${base}/user/opens?ids=" + id;
        } else {
            return false;
        }
    };

    function disable() {
        if (confirm('是否禁用')) {
            var id = "";
            var ids = document.getElementsByName("id");
            for (var i = 0; i < ids.length; i++) {
                if (ids[i].checked == true) {
                    id += ids[i].value + ",";
                }
            }
            location.href = "${base}/user/disable?ids=" + id;
        } else {
            return false;
        }
    };
</script>
</body>
</html>