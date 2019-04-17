<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<style>
    tr{
        text-align: center;
    }
</style>
    <%--表格--%>
    <div style="width: 1100px" >
        <table id="table1"></table>
    </div>

    <%-- 表格工具栏 --%>
    <div id="tool1">
        <a href="javascript:void(0)" id="delAllBtn1" class="easyui-linkbutton" data-options="text:'批量删除',iconCls:'icon-remove'"></a>
        <a href="javascript:void(0)" id="addBtn1" class="easyui-linkbutton" data-options="text:'添加',iconCls:'icon-add'"></a>
        <a href="javascript:void(0)" id="updBtn1" class="easyui-linkbutton" data-options="text:'修改',iconCls:'icon-edit'"></a>
    <%--下拉框--%>
        <input type="text" class="easyui-searchbox" data-options="width:200,menu:'#mm1'" id="sbox1"/>
            <div id="mm1">
                <div data-options="name:'username'">UserName</div>
                <div data-options="name:'username'">username</div>
            </div>
    </div>

    <%-- 会话窗口 --%>
    <div id="dialog1" style="display: none;padding-top: 50px" align="center">
        <form method="post" id="form1">
            <table>
            <tr>
                <td>用户ID:</td>
                <td>
                    <input type="text" name="u_id" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>用户名:</td>
                <td>
                    <input type="text" name="username" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>密码:</td>
                <td>
                    <input type="text" name="password" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>姓名:</td>
                <td>
                    <input type="text" name="name" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>邮箱:</td>
                <td>
                    <input type="text" name="email" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>电话:</td>
                <td>
                    <input type="text" name="phone" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>地址:</td>
                <td>
                    <input type="text" name="addr" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>状态:</td>
                <td>
                <input type="text" name="state" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            </table>
        </form>
    </div>

    <script>
        <%--数据表格 展示所有--%>
        $("#table1").datagrid({
            title:'用户信息',
            fitColumns:true, //自动计算列宽
            columns:[[
                {field:'ck',checkbox:true},
                {field:'u_id',title:'用户ID',width:100},
                {field:'username',title:'用户名',width:100},
                {field:'password',title:'密码',width:100},
                {field:'name',title:'姓名',width:100},
                {field:'email',title:'邮箱',width:100},
                {field:'phone',title:'电话',width:100},
                {field:'addr',title:'地址',width:100},
                {field:'state',title:'状态',width:100},
            ]],
            url:'user/selectAll.do',
            pagination:true,  //分页工具栏
            loadMsg:'亲~努力加载中，不要着急哦！',
            rownumbers:true,
            striped:true,
            ctrlSelect:true,
            pageList:[5,10,15],
            pageSize:5,
            pageNumber:1,
            toolbar:'#tool1',
        });

        <%--下拉框 模糊查询--%>
        $("#sbox1").searchbox({
            searcher:function (value,name) {
                $("#table1").datagrid('load',{
                    username:value.trim()
                });
            }
        })

        <%--修改--%>
        $("#updBtn1").click(function () {
            var hang = $("#table1").datagrid("getSelected");
            if(hang){
                //初始化
                $("#form1").form({
                    url:'user/update.do',
                    onSubmit:function (param) {
                        //完成表单验证
                        return $("#form1").form('validate');
                    },
                    success:function (r) {
                        //关闭会话框
                        $("#dialog1").dialog('close');
                        //同时刷新数据
                        $("#table1").datagrid('load');
                    }
                });
                //给表单填充数据
                $("#form1").form('load',{
                    u_id:hang.u_id,
                    username:hang.username,
                    password:hang.password,
                    name:hang.name,
                    email:hang.email,
                    phone:hang.phone,
                    addr:hang.addr,
                    state:hang.state
                });
                // 初始化会话窗口
                $("#dialog1").dialog({
                    title:'修改',
                    iconCls:'icon-edit',
                    width:400,
                    height:400,
                    modal:true,  //遮盖效果
                    buttons:[{
                        text:'提交',
                        iconCls:'icon-ok',
                        handler:function () {
                            //提交表单
                            $("#form1").submit();
                        }
                    }]
                })
            }else {
                $.messager.alert('提示','请选择一行','warning');
            }
        });

        <%--添加--%>
        $("#addBtn1").click(function () {
            //初始化
            $("#form1").form({
                url: 'user/add.do',
                onSubmit: function (param) {
                    //完成表单验证
                    return $("#form1").form('validate');
                },
                success: function (r) {
                    console.log(r);
                    //关闭会话框
                    $("#dialog1").dialog('close');
                    //同时刷新数据
                    $("#table1").datagrid('load');
                }
            });
            // 初始化会话窗口
            $("#dialog1").dialog({
                title:'添加',
                iconCls:'icon-add',
                width:400,
                height:400,
                modal:true,  //遮盖效果
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function () {
                        //提交表单
                        $("#form1").submit();
                    }
                }]
            });
        })

        <%--批量删除--%>
        $("#delAllBtn1").click(function () {
            var hang = $("#table1").datagrid("getSelections");
            var ids = new Array();
            for(var i=0;i<hang.length;i++){
                ids.push(hang[i].u_id);
            }
            $.ajax({
                url:'user/deleteByIds.do?ids='+ids,
                success:function (data) {
                    $("#table1").datagrid("load");
                }
            })
        })
    </script>
</body>
</html>
