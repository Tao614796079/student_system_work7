/**
 * Created by Administrator on 2017/4/27.
 */
function addStudent() {
    var id = $("#id").val();
    var name = $("#name").val();
    var gender = $('input:radio[name="gender"]:checked').val();
    var grade = $("#gradeId option:selected").val();
    var birthday = $("#birthday").val();

    if (id.trim() == null || id.trim() == "") {
        alert("请输入学号");
        $("#id").focus();
        return;
    }
    if (name.trim() == null || name.trim() == "") {
        alert("请输入姓名");
        $("#name").focus();
        return;
    }
    if (gender == null || gender == "") {
        alert("请选择性别");
        return;
    }
    if (grade.trim() == null || grade.trim() == "") {
        alert("请选择班级");
        $("#gradeId").focus();
        return;
    }
    if (birthday.trim() == null || birthday.trim() == "") {
        alert("请选择出生日期");
        $("#birthday").focus();
        return;
    }
    $("#addStudentForm").submit();
}

function updateStudent() {
    var id = $("#id").val();
    var name = $("#name").val();
    var gender = $('input:radio[name="gender"]:checked').val();
    var grade = $("#gradeId option:selected").val();
    var birthday = $("#birthday").val();
    // alert("id="+id);
    // alert("name="+name);
    // alert("gender="+gender);
    // alert("grade="+grade);
    // alert("birthday"+birthday);
    if (name.trim() == null || name.trim() == "") {
        alert("请输入姓名");
        $("#name").focus();
        return;
    }
    if (gender == null || gender == "") {
        alert("请选择性别");
        return;
    }
    if (grade.trim() == null || grade.trim() == "") {
        alert("请选择班级");
        $("#gradeId").focus();
        return;
    }
    if (birthday.trim() == null || birthday.trim() == "") {
        alert("请选择出生日期");
        $("#birthday").focus();
        return;
    }
    $("#updateStudentForm").submit();
}

function addGrade() {

    var name = $("#name").val();
    if (name.trim() == null || name.trim() == "") {
        alert("请输入班级名称");
        $("#name").focus();
        return;
    }
    $("#addGrade").submit();
}
function addSubject() {

    var name = $("#name").val();
    if (name.trim() == null || name.trim() == "") {
        alert("请输入课程名称");
        $("#name").focus();
        return;
    }
    $("#addSubject").submit();
}