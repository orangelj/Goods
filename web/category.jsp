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
        <table id="table12"></table>
    </div>

    <%-- 表格工具栏 --%>
    <div id="tool12">
        <a href="javascript:void(0)" id="delAllBtn12" class="easyui-linkbutton" data-options="text:'批量删除',iconCls:'icon-remove'"></a>
        <a href="javascript:void(0)" id="addBtn12" class="easyui-linkbutton" data-options="text:'添加',iconCls:'icon-add'"></a>
        <a href="javascript:void(0)" id="updBtn12" class="easyui-linkbutton" data-options="text:'修改',iconCls:'icon-edit'"></a>
    <%--下拉框--%>
        <input type="text" class="easyui-searchbox" data-options="width:200,menu:'#mm12'" id="sbox12"/>
            <div id="mm12">
                <div data-options="name:'cname'">cname</div>
                <div data-options="name:'cname'">cname</div>
            </div>
    </div>

    <%-- 会话窗口 --%>
    <div id="dialog12" style="display: none;padding-top: 50px" align="center">
        <form method="post" id="form12">
            <table>
                <tr>
                    <td>类别ID:</td>
                    <td>
                        <input type="text" name="cid" class="easyui-validatebox" data-options="required:true"/>
                    </td>
                </tr>
                <tr>
                    <td>类别名:</td>
                    <td>
                        <input type="text" name="cname" class="easyui-validatebox" data-options="required:true"/>
                    </td>
                </tr>
                <tr>
                    <td>parentId:</td>
                    <td>
                        <input type="text" name="parentId" class="easyui-validatebox" data-options="required:true"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <script>
        <%--数据表格 展示所有--%>
        $("#table12").datagrid({
            title:'类别信息',
            fitColumns:true, //自动计算列宽
            columns:[[
                {field:'ck',checkbox:true},
                {field:'cid',title:'类别ID',width:100},
                {field:'cname',title:'类别名',width:100},
                {field:'parentId',title:'parentId',width:100},
            ]],
            url:'category/selectAll.do',
            pagination:true,  //分页工具栏
            loadMsg:'亲~努力加载中，不要着急哦！',
            rownumbers:true,
            striped:true,
            ctrlSelect:true,
            pageList:[5,10,15],
            pageSize:5,
            pageNumber:1,
            toolbar:'#tool12',
        });

        <%--下拉框 模糊查询--%>
        $("#sbox12").searchbox({
            searcher:function (value,name) {
                $("#table12").datagrid('load',{
                    cname:value.trim()
                });
            }
        })

        <%--修改--%>
        $("#updBtn12").click(function () {
            var hang = $("#table12").datagrid("getSelected");
            if(hang){
                //初始化
                $("#form12").form({
                    url:'category/update.do',
                    onSubmit:function (param) {
                        //完成表单验证
                        return $("#form12").form('validate');
                    },
                    success:function (r) {
                        //关闭会话框
                        $("#dialog12").dialog('close');
                        //同时刷新数据
                        $("#table12").datagrid('load');
                    }
                });
                //给表单填充数据
                $("#form12").form('load',{
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
                $("#dialog12").dialog({
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
                            $("#form12").submit();
                        }
                    }]
                })
            }else {
                $.messager.alert('提示','请选择一行','warning');
            }
        });

        <%--添加--%>
        $("#addBtn12").click(function () {
            //初始化
            $("#form12").form({
                url: 'category/add.do',
                onSubmit: function (param) {
                    //完成表单验证
                    return $("#form12").form('validate');
                },
                success: function (r) {
                    console.log(r);
                    //关闭会话框
                    $("#dialog12").dialog('close');
                    //同时刷新数据
                    $("#table12").datagrid('load');
                }
            });
            // 初始化会话窗口
            $("#dialog12").dialog({
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
                        $("#form12").submit();
                    }
                }]
            });
        })

        <%--批量删除--%>
        $("#delAllBtn12").click(function () {
            var hang = $("#table12").datagrid("getSelections");
            var ids = new Array();
            for(var i=0;i<hang.length;i++){
                ids.push(hang[i].u_id);
            }
            $.ajax({
                url:'category/deleteByIds.do?ids='+ids,
                success:function (data) {
                    $("#table12").datagrid("load");
                }
            })
        })
    </script>
</body>
</html>
