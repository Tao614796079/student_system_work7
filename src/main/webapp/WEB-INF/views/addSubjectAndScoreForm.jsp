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
                        录入成绩
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                            <div style="margin-left: 40px">
                                <form>
                                    <input type="hidden" id="studentId" name="studentId"
                                           value="${studentId}">
                                    <c:forEach items="${uncheckedSubjectList}" var="subjectVO">
                                        <div>
                                            <div class="form-group">
                                                <label class="pos-rel">
                                                    <input type="checkbox" name="subject_id"
                                                           class="ace check-add-input"
                                                           value="${subjectVO.id}"/>
                                                    <span class="lbl lbl-subject"
                                                          style="font-size: 16px">${subjectVO.name}</span>
                                                    <span></span>
                                                </label>
                                            </div>
                                            <div class="space-4"></div>
                                        </div>
                                    </c:forEach>
                                    <button class="btn btn-sm btn-success pull-left"
                                            data-dismiss="modal" type="button"
                                            onclick="submitAddSubject()">
                                        <i class="ace-icon fa fa-times"></i>
                                        提交
                                    </button>
                                </form>
                            </div>
                        </div><!-- /.row -->
                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
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
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
<script src="assets/js/dataTables.buttons.min.js"></script>
<script src="assets/js/buttons.flash.min.js"></script>
<script src="assets/js/buttons.html5.min.js"></script>
<script src="assets/js/buttons.print.min.js"></script>
<script src="assets/js/buttons.colVis.min.js"></script>
<script src="assets/js/dataTables.select.min.js"></script>

<!-- ace scripts -->
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    $(".check-add-input").click(function () {
        if ($(this).is(':checked')) {
            $(this).next().next().append("<input type='text' name='score'placeholder='请输入成绩'>")
        } else {
            $(this).next().next().empty();
        }
    });

    $(".btn-selectSubject").on("click", function () {
        var stuId = $(this).attr("data-id");
        $("#studentId").val(stuId);
    });
    function submitAddSubject() {
        var studentId = $("#studentId").val();
        var subjects = [];
        var scores = [];
        $('input[name="subject_id"]:checked').each(function () {
            subjects.push($(this).val());
        });
        $('input[name="score"]:input').each(function () {
            scores.push($(this).val());
        });
        console.log(studentId);
        console.log(subjects);
        console.log(scores);
        $.ajax({
            type: "POST",
            url: "addSubjectAndScoreToStudent",
            traditional: true,
            data: {
                "subjects": JSON.stringify(subjects),
                "studentId": studentId,
                "scores": JSON.stringify(scores)
            },
            dataType: "json",
            async: false,
            success: function (data) {
                if (data) {
                    window.location.href="/index.jsp";
                }
            }
        });
    }
</script>
</body>
</html>

