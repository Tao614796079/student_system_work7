<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/5
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>班级信息</title>

    <meta name="description" content="Static &amp; Dynamic Tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet"
          id="main-ace-style"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet"/>
    <![endif]-->
    <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <script src="assets/js/ace-extra.min.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin">
<div id="navbar" class="navbar navbar-default          ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="tables2.html" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    Student System
                </small>
            </a>
        </div>
    </div><!-- /.navbar-container -->
</div>

<div class="main-container ace-save-state" id="main-container">
    <div id="sidebar" class="sidebar                  responsive                    ace-save-state">
        <ul class="nav nav-list">
            <li class="text-center">
                <a href="${pageContext.request.contextPath}/studentMain">
							<span class="menu-text">
								学生
							</span>
                </a>
            </li>
            <li class="text-center">
                <a href="${pageContext.request.contextPath}/gradeMain">
							<span class="menu-text">
								班级
							</span>
                </a>
            </li>
            <li class="text-center">
                <a href="${pageContext.request.contextPath}/subjectMain">
							<span class="menu-text">
								课程
							</span>
                </a>
            </li>
        </ul><!-- /.nav-list -->
    </div>

    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="page-header">
                    <h1>
                        班级信息
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="col-xs-12">
                            <div class="col-xs-3 pull-right">
                                <form action="/addGrade" method="post" id="addGrade">
                                    <div class="input-group">
                                        <input type="text" class="form-control search-query"
                                               name="name" placeholder="班级名称" minlength="2" maxlength="10" required/>
                                        <span class="input-group-btn">
                                            <button class="btn btn-sm btn-primary pull-right"
                                                    type="submit">
                                                <i class="ace-icon glyphicon glyphicon-plus"></i>添加</button>
                                        </span>
                                    </div>
                                </form>
                            </div>
                            <br>
                            <div class="space-6"></div>
                            <br>
                            <table id="simple-table" class="table  table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>班级名称</th>
                                    <th>人数</th>
                                    <th class="hidden-480">平均分</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${gradeVOList}" var="gradeVO" varStatus="status">
                                    <!--list1-->
                                    <tr>
                                        <td>${status.index+1}</td>
                                        <td>${gradeVO.name}</td>
                                        <td><a href="#">${gradeVO.studentNumber}</a></td>
                                        <td class="hidden-480">${gradeVO.avgScore}</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-info btn-grade-update"
                                                        href="#modal-table" data-toggle="modal"
                                                        data-id="${gradeVO.id}"
                                                        data-name="${gradeVO.name}">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </button>
                                                <button class="btn btn-xs btn-danger delete-grade"
                                                        data-id="${gradeVO.id}">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>
                                            </div>
                                            <div class="hidden-md hidden-lg">
                                                <div class="inline pos-rel">
                                                    <button class="btn btn-minier btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            data-position="auto">
                                                        <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                                    </button>

                                                    <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                        <li>
                                                            <a href="#" class="tooltip-info"
                                                               data-rel="tooltip"
                                                               title="View">
																			<span class="blue">
																				<i class="ace-icon fa fa-search-plus bigger-120"></i>
																			</span>
                                                            </a>
                                                        </li>

                                                        <li>
                                                            <a href="#" class="tooltip-success"
                                                               data-rel="tooltip"
                                                               title="Edit">
																			<span class="green">
																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
                                                            </a>
                                                        </li>

                                                        <li>
                                                            <a href="#" class="tooltip-error"
                                                               data-rel="tooltip"
                                                               title="Delete">
																			<span class="red">
																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div><!-- /.span -->
                    </div><!-- /.row -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
<!--model-->
<div id="modal-table" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header no-padding">
                <div class="table-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span class="white">&times;</span>
                    </button>
                    输入班级名称
                </div>
            </div>
            <div class="modal-body">

                <div class="input-group">
                    <input type="text" class="form-control search-query" id="gradeName"/>
                    <input type="hidden" id="gradeId">
                    <span class="input-group-btn">
                                <button type="button" class="btn btn-purple btn-sm "
                                        id="update-grade-name">
                                    <span class="ace-icon glyphicon glyphicon-ok icon-on-right bigger-110"></span>
                                    修改
                                </button>
                            </span>
                </div>
            </div>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div>
<!-- basic scripts -->

<!--[if !IE]> -->
<script src="assets/js/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart'
        in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
        + "<"
        + "/script>");
</script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
<script src="assets/js/dataTables.buttons.min.js"></script>
<script src="assets/js/buttons.flash.min.js"></script>
<script src="assets/js/buttons.html5.min.js"></script>
<script src="assets/js/buttons.print.min.js"></script>
<script src="assets/js/buttons.colVis.min.js"></script>
<script src="assets/js/dataTables.select.min.js"></script>
<!-- jQuery Validate scripts -->
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<!-- ace scripts -->
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    $(".btn-grade-update").click(function () {
        var gradeId = $(this).attr("data-id");
        var gradeName = $(this).attr("data-name");
        $("#gradeId").val(gradeId);
        $("#gradeName").val(gradeName);
    });
    $("#update-grade-name").click(function () {
        var gradeId =$("#gradeId").val();
        var gradeName = $("#gradeName").val();
        $.ajax({
            type: "POST",
            url: "updateGrade",
            traditional: true,
            data: {"id": gradeId,"name":gradeName},
            dataType: "json",
            async: false,
            success: function (data) {
                if (data) {
                    window.location.reload();
                }
            }
        });
    });
    $(".delete-grade").on("click", function () {
        var gradeId = $(this).attr("data-id");
        $.ajax({
            type: "GET",
            url: "deleteGrade",
            traditional: true,
            data: {"id": gradeId},
            dataType: "json",
            async: false,
            success: function (data) {
                if (data) {
                    window.location.reload();
                } else {
                    alert("删除失败，班级里还有学生。");
                }
            }
        });
    });
</script>
</body>
</html>

