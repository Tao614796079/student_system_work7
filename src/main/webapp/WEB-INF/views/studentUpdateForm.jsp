<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/6
  Time: 13:27
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
    <title>修改学生信息</title>

    <meta name="description" content="Common form elements and layouts"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css"/>
    <link rel="stylesheet" href="assets/css/chosen.min.css"/>
    <link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css"/>
    <link rel="stylesheet" href="assets/css/bootstrap-timepicker.min.css"/>
    <link rel="stylesheet" href="assets/css/daterangepicker.min.css"/>
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="assets/css/bootstrap-colorpicker.min.css"/>

    <!-- text fonts -->
    <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css"/>
    <script src="js/form.js"></script>
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
                <a href="${pageContext.request.contextPath}/studentMain">
							<span class="menu-text">
								学科
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
                        修改学生信息
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <form id="updateStudentForm" class="form-horizontal" role="form"
                              action="${pageContext.request.contextPath}/updateStudentForm"
                              method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                       for="form-field-1-1"> 学号 </label>
                                <div class="col-sm-4">
                                    <input readonly="" type="text" id="form-field-1-1"
                                           class="form-control" value="${studentVO.id}"/>
                                    <input type="hidden" name="id" id="id" value="${studentVO.id}">
                                    <input type="hidden" name="avgScore" id="avgScore"
                                           value="${studentVO.avgScore}">
                                </div>
                            </div>
                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="name">
                                    姓名 </label>
                                <div class="col-sm-4">
                                    <input type="text" id="name" class="form-control" name="name"
                                           value="${studentVO.name}"/>
                                </div>
                            </div>
                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                       for="form-field-1-1"> 性别 </label>
                                <div class="col-sm-4">
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
                                <label class="col-sm-3 control-label no-padding-right"
                                       for="gradeId">班级 </label>

                                <div class="col-sm-4">
                                    <input type="hidden" value="${studentVO.gradeVO.id}"
                                           name="oldGradeId">
                                    <div>
                                        <select class="form-control" id="gradeId" name="gradeId">
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
                                <label class="col-sm-3 control-label no-padding-right">生日 </label>

                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input class="form-control date-picker" id="birthday"
                                               type="text" name="birthday"
                                               data-date-format="yyyy-mm-dd"/>
                                        <span class="input-group-addon">
                                                    <i class="fa fa-calendar bigger-110"></i>
                                                </span>
                                    </div>
                                </div>
                            </div>
                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                       for="form-field-1-1"> 照片 </label>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <input type="file" id="id-input-file-2" name="myfiles"/>
                                            <input type="hidden" name="imageUrl"
                                                   value="${studentVO.imageUrl}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="space-4"></div>
                            <div class="clearfix form-actions">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-info" type="button"
                                            onclick="updateStudent()">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Submit
                                    </button>

                                    &nbsp; &nbsp; &nbsp;
                                    <button class="btn" type="reset">
                                        <i class="ace-icon fa fa-undo bigger-110"></i>
                                        Reset
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

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

<!--[if lte IE 8]>
<script src="assets/js/excanvas.min.js"></script>
<![endif]-->
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
        $('.date-picker').datepicker({
            autoclose: true, todayHighlight: true
        })
        //show datepicker when clicking on the icon
            .next().on(ace.click_event, function () {
            $(this).prev().focus();
        });
        $('#id-input-file-2').ace_file_input({
            no_file: 'No File ...',
            btn_choose: 'Choose',
            btn_change: 'Change',
            droppable: false,
            onchange: null,
            thumbnail: false, //| true | large
            whitelist: 'gif|png|jpg|jpeg'
        });
    });
</script>
</body>
</html>

