<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/themes/default/easyui.css"/>
    <link rel="stylesheet" href="css/themes/icon.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
</head>
<body bgcolor="#C2D5F1">
    <div id="test">
        <form id="form" style="margin: 150px 500px">
            <p>
                <input id="username" data-options="required:true" class="easyui-validatebox" name="username" type="text" style="width:300px">
            </p>
            <p>
                <input id="password" data-options="required:true" class="easyui-validatebox" name="password" type="text" style="width:300px">
            </p>
            <p align="center">
                <a href="javascript:void(0)" class="easyui-linkbutton" id="login"style="width:50px">
                    登录
                </a>
                <a href="javascript:void(0)" class="easyui-linkbutton" id="register"style="width:50px">
                    注册
                </a>
            </p>
        </form>
    </div>

    <div id="test1" style="display: none;text-align: center;padding-top: 60px" >
        <form id="form1" >
            <p>
                <input id="username1" data-options="required:true" class="easyui-validatebox" name="username" style="width:300px">
            </p>
            <p>
                <input id="password1" data-options="required:true" class="easyui-validatebox" name="password" style="width:300px">
            </p>
        </form>
    </div>
</body>
<script>
    $("#username").textbox({
        iconCls:'icon-man',
        iconAlign:'right',
        label: 'username:',
        prompt:'username',

    })

    $("#password").passwordbox({
        iconAlign:'right',
        label: 'password:',
        prompt:'password',
        showEye: true,
    })

    $("#username1").textbox({
        iconCls:'icon-man',
        iconAlign:'right',
        label: 'username:',
        prompt:'username',

    })

    $("#password1").passwordbox({
        iconAlign:'right',
        label: 'password:',
        prompt:'password',
        showEye: true,
    })

    $("#register").click(function () {
        //初始化
        $("#form1").form({
            url: 'admin/register.do',
            onSubmit: function (param) {
                //完成表单验证
                return $("#form1").form('validate');
            },
            success: function (r) {
                    $.messager.confirm("提示","注册成功，跳转到主页？",function (r) {
                        if (r){
                            window.location.href='main.jsp';
                        } else {
                            //关闭会话框
                            $("#test1").dialog('close');
                        }
                    })

            }
        });
        // 初始化会话窗口
        $("#test1").dialog({
            title: '注册',
            iconCls: 'icon-edit',
            width: 400,
            height: 300,
            modal: true,  //遮盖效果
            buttons: [{
                text: '注册',
                iconCls: 'icon-edit',
                handler: function () {
                    //提交表单
                    $("#form1").submit();
                }
            }]
        });
    })

    $("#login").click(function () {
        //初始化
        $("#form").form({
            url: 'admin/login.do',
            onSubmit: function (param) {
                //完成表单验证
                return $("#form").form('validate');
            },
            success: function (r) {
                if (r==1){
                    window.location.href='main.jsp';
                } else {
                    $.messager.alert("提示","用户名或密码有错！","error");
                }

            }
        });
        $("#form").submit();
    })
</script>
</html>
