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
    <title>学生列表</title>

    <meta name="description" content="Static &amp; Dynamic Tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet"
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
    <script src="js/form.js"></script>
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
            <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand">
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
                <a href="${pageContext.request.contextPath}/index.jsp">
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
                        学生信息
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                            <div class="col-xs-12">
                                <div>
                                    <button href="#modal-form" data-toggle="modal"
                                            class="btn btn-sm btn-primary pull-right"><i
                                            class="ace-icon glyphicon glyphicon-plus"></i>
                                        添加
                                    </button>
                                </div>
                                <br>
                                <div class="space-6"></div>
                                <br>
                                <table id="simple-table" class="table  table-bordered table-hover"
                                       style="margin: 0px">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>学号</th>
                                        <th>姓名</th>
                                        <th class="hidden-480">性别</th>
                                        <th>出生日期</th>
                                        <th class="hidden-480">班级</th>
                                        <th>选修科目</th>
                                        <th>平均分数</th>
                                        <th class="detail-col">详情</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${studentVOList}" var="studentVO"
                                               varStatus="status">
                                        <!--list1-->
                                        <tr>
                                            <td>${status.index+1}</td>
                                            <td>${studentVO.id}</td>
                                            <td>${studentVO.name}</td>
                                            <td class="hidden-480">${studentVO.gender}</td>
                                            <td><fmt:formatDate value="${studentVO.birthday}"
                                                                pattern="yyyy-MM-dd"/></td>
                                            <td class="hidden-480">${studentVO.gradeVO.name}</td>
                                            <td>${studentVO.subjectVOList.size()}</td>
                                            <td>${studentVO.avgScore}</td>
                                            <td class="center">
                                                <div class="action-buttons">
                                                    <a href="#"
                                                       class="green bigger-140 show-details-btn"
                                                       title="Show Details">
                                                        <i class="ace-icon fa fa-angle-double-down"></i>
                                                        <span class="sr-only">Details</span>
                                                    </a>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <button class="btn btn-xs btn-group"
                                                            title="录入成绩"
                                                            onclick="window.location.href='${pageContext.request.contextPath}/goAddSubjectAndScoreForm?id=${studentVO.id}'">
                                                        <i class="ace-icon fa fa-check bigger-120"></i>
                                                    </button>
                                                    <button class="btn btn-xs btn-info" title="修改信息"
                                                            onclick="window.location.href='${pageContext.request.contextPath}/goUpdateStudentForm?id=${studentVO.id}'">
                                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                    </button>
                                                    <button class="btn btn-xs btn-danger btn-delete-student"
                                                            href="#modal-delete-confirm"
                                                            data-toggle="modal"
                                                            data-id="${studentVO.id}"
                                                        <%--onclick="window.location.href='${pageContext.request.contextPath}/deleteStudent?id=${studentVO.id}'"--%>
                                                            title="删除学生">
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
                                        <!--detail1-->
                                        <tr class="detail-row">
                                            <td colspan="10">
                                                <div class="table-detail">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-2">
                                                            <div class="text-center">
                                                                <img height="150"
                                                                     class="thumbnail inline no-margin-bottom"
                                                                     alt="该学生未上传头像"
                                                                     src="${studentVO.imageUrl}"/>
                                                                <br/>
                                                                <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                                                    <div class="inline position-relative">
                                                                        <a class="user-title-label"
                                                                           href="#">
                                                                            <i class="ace-icon fa fa-circle light-green"></i>
                                                                            &nbsp;
                                                                            <span class="white">${studentVO.name}</span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12 col-sm-7">
                                                            <div class="space visible-xs"></div>

                                                            <div class="profile-user-info profile-user-info-striped">
                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name">
                                                                        姓名
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span>${studentVO.name}</span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name">
                                                                        学号
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span>${studentVO.id}</span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name">
                                                                        性别
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span>${studentVO.gender}</span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name">
                                                                        生日
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                    <span><fmt:formatDate
                                                                            value="${studentVO.birthday}"
                                                                            pattern="yyyy-MM-dd"/></span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name">
                                                                        班级
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span>${studentVO.gradeVO.name}</span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name">
                                                                        平均分
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span>${studentVO.avgScore}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-3">
                                                            <div class="space visible-xs"></div>
                                                            <h4 class="header blue lighter less-margin">
                                                                已选科目</h4>

                                                            <div class="space-6"></div>
                                                            <c:forEach
                                                                    items="${studentVO.subjectVOList}"
                                                                    var="subjectVO">
                                                                <div class="col-xs-12 col-sm-6 subject-name">${subjectVO.name}</div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="message-footer clearfix">
                                    <!--<div class="pull-left"> 151 messages total</div>-->

                                    <div class="pull-right">
                                        <div class="inline middle"> 共${totalPage}页</div>

                                        &nbsp; &nbsp;
                                        <ul class="pagination middle">
                                            <c:choose>
                                                <c:when test="${curPage == 1}">
                                                    <li class="disabled">
                                                        <span>
                                                            <i class="ace-icon fa fa-step-backward middle"></i>
                                                        </span>
                                                    </li>
                                                    <li class="disabled">
                                                        <span>
                                                            <i class="ace-icon fa fa-caret-left bigger-140 middle"></i>
                                                        </span>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/studentMain?curPage=${1}">
                                                            <i class="ace-icon fa fa-step-backward middle"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/studentMain?curPage=${curPage - 1}">
                                                            <i class="ace-icon fa fa-caret-left bigger-140 middle"></i>
                                                        </a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                            <li>
                                                <span>
                                                    <input value="${curPage}" id="page-input"
                                                           maxlength="3" type="text"/>
                                                </span>
                                            </li>
                                            <c:choose>
                                                <c:when test="${curPage == totalPage}">
                                                    <li class="disabled">
                                                        <span>
                                                            <i class="ace-icon fa fa-caret-right bigger-140 middle"></i>
                                                        </span>
                                                    </li>
                                                    <li class="disabled">
                                                        <span>
                                                            <i class="ace-icon fa fa-step-forward middle"></i>
                                                        </span>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/studentMain?curPage=${curPage + 1}">
                                                            <i class="ace-icon fa fa-caret-right bigger-140 middle"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/studentMain?curPage=${totalPage}">
                                                            <i class="ace-icon fa fa-step-forward middle"></i>
                                                        </a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </div>
                                </div>
                            </div><!-- /.span -->
                        </div><!-- /.row -->
                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->
<!--modal-->
<div id="modal-form" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="blue bigger">请输入学生信息</h4>
            </div>
            <form class="form-horizontal" role="form" id="addStudentForm"
                  action="${pageContext.request.contextPath}/addStudent" method="post"
                  enctype="multipart/form-data">

                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-3">
                            <div class="space"></div>

                            <input type="file" name="myfiles"/>
                        </div>

                        <div class="col-xs-12 col-sm-9">

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"
                                       for="id"> 学号 </label>
                                <div class="col-sm-9">
                                    <input type="text" id="id" class="form-control"
                                           name="id"/>
                                </div>
                            </div>
                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"
                                       for="name"> 姓名 </label>
                                <div class="col-sm-9">
                                    <input type="text" id="name" class="form-control"
                                           name="name"/>
                                </div>
                            </div>
                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"> 性别 </label>
                                <div class="col-sm-9">
                                    <div class="control-group">
                                        <div class="radio">
                                            <label>
                                                <input name="gender" type="radio" class="ace"
                                                       value="男"/>
                                                <span class="lbl"> 男</span>
                                            </label>
                                            &nbsp; &nbsp; &nbsp;
                                            <label>
                                                <input name="gender" type="radio" class="ace"
                                                       value="女"/>
                                                <span class="lbl"> 女</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"
                                       for="gradeId">班级 </label>

                                <div class="col-sm-9">
                                    <div>
                                        <select class="form-control" id="gradeId"
                                                name="gradeId">
                                            <option value=""></option>
                                            <c:forEach items="${gradeVOList}" var="gradeVO">
                                                <option value="${gradeVO.id}">${gradeVO.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">生日 </label>

                                <div class="col-sm-9">
                                    <div class="input-group">

                                        <input class="form-control date-picker"
                                               id="birthday" type="text" name="birthday"
                                               data-date-format="yyyy-mm-dd"/>
                                        <span class="input-group-addon">
                                                    <i class="fa fa-calendar bigger-110"></i>
                                                </span>
                                    </div>
                                </div>
                            </div>
                            <div class="space-4"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-sm" type="reset">
                        <i class="ace-icon fa fa-undo "></i>
                        重置
                    </button>
                    <button class="btn btn-sm btn-primary" type="button" onclick="addStudent()">
                        <i class="ace-icon fa fa-check"></i>
                        保存
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="modal-delete-confirm" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body center">
                <div>
                    <h3>是否删除学生信息和成绩？</h3>
                    <input type="hidden" id="delete-student-id">
                </div>
                <div>
                    <button class="btn btn-sm" data-dismiss="modal">
                        <i class="ace-icon fa fa-times "></i>
                        关闭
                    </button>
                    <button class="btn btn-sm btn-primary" type="button" id="delete-student"
                            data-dismiss="modal">
                        <i class="ace-icon fa fa-check"></i>
                        确认
                    </button>
                </div>
            </div>
        </div>
    </div>
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

<script src="assets/js/jquery-ui.custom.min.js"></script>
<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="assets/js/chosen.jquery.min.js"></script>
<script src="assets/js/spinbox.min.js"></script>
<script src="assets/js/bootstrap-datepicker.min.js"></script>
<script src="assets/js/bootstrap-timepicker.min.js"></script>
<script src="assets/js/moment.min.js"></script>
<script src="assets/js/daterangepicker.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/js/bootstrap-colorpicker.min.js"></script>
<script src="assets/js/jquery.knob.min.js"></script>
<script src="assets/js/autosize.min.js"></script>
<script src="assets/js/jquery.inputlimiter.min.js"></script>
<script src="assets/js/jquery.maskedinput.min.js"></script>
<script src="assets/js/bootstrap-tag.min.js"></script>
<!-- ace scripts -->
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {
        $(".btn-delete-student").click(function () {
            var stuId = $(this).attr("data-id");
            $("#delete-student-id").val(stuId);
        });
        $("#delete-student").click(function () {
            var stuId = $("#delete-student-id").val();
            $.ajax({
                type: "GET", url: "deleteStudent", traditional: true, data: {
                    "id": stuId
                }, success: function () {
                    window.location.reload();
                }
            });
        });
        $('#page-input').on('keypress', function (event) {
            if (event.keyCode == 13) {
                var page = $('#page-input').val();
                window.location.href = "${pageContext.request.contextPath}/studentMain?curPage="
                    + page;
            }
        });

        $('.show-details-btn').on('click', function (e) {
            e.preventDefault();
            $(this).closest('tr').next().toggleClass('open');
            $(this)
                .find(ace.vars['.icon'])
                .toggleClass('fa-angle-double-down')
                .toggleClass('fa-angle-double-up');
        });
        $('#modal-form input[type=file]').ace_file_input({
            style: 'well',
            btn_choose: '照片',
            btn_change: null,
            no_icon: 'ace-icon fa fa-cloud-upload',
            droppable: true,
            thumbnail: 'large'
        });
        $('.date-picker').datepicker({
            autoclose: true, todayHighlight: true
        }).next().on(ace.click_event, function () {
            $(this).prev().focus();
        });
    });
</script>
</body>
</html>

