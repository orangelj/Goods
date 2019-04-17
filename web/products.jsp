<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>product</title>
    <link href="css/themes/default/easyui.css" rel="stylesheet"/>
    <link href="css/themes/icon.css" rel="stylesheet"/>
    <script  src="js/jquery.min.js"></script>
    <script  src="js/jquery.easyui.min.js"></script>

</head>
<body>
<style>
    tr{
        text-align: center;
    }
</style>
    <%--表格--%>
    <div style="width: 1100px" id="haha">
        <table id="table"></table>
    </div>

    <%-- 表格工具栏 --%>
    <div id="tool">
        <a href="javascript:void(0)" id="delAllBtn" class="easyui-linkbutton" data-options="text:'批量删除',iconCls:'icon-remove'"></a>
        <a href="javascript:void(0)" id="addBtn" class="easyui-linkbutton" data-options="text:'添加',iconCls:'icon-add'"></a>
        <a href="javascript:void(0)" id="updBtn" class="easyui-linkbutton" data-options="text:'修改',iconCls:'icon-edit'"></a>
    <%--下拉框--%>
        <input type="text" class="easyui-searchbox" data-options="width:200,menu:'#mm'" id="sbox"/>
            <div id="mm">
                <div data-options="name:'pname'">Name</div>
                <div data-options="name:'shop_price'">shop_price</div>
            </div>
    </div>

    <%-- 会话窗口 --%>
    <div id="dialog" style="display: none;padding-top: 30px" align="center">
        <form method="post" id="form">
            <table>
            <tr>
                <td>商品编码:</td>
                <td>
                <input type="text" name="pid" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>商品名称:</td>
                <td>
                <input type="text" name="pname" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>市场价:</td>
                <td>
                <input type="text" name="market_price" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>商品价格:</td>
                <td>
                <input type="text" name="shop_price" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>商品图片:</td>
                <td>
                <div id="img" style="width:50px;height:50px;border:solid 1px gray;">
                    <img src="products/1/cs10001.jpg" style="width:50px;height:50px;">
                </div>
                <input class="easyui-filebox" name="goodsImg" data-options="required:true,accept:'image/jpeg'">
                </td>
            </tr>
            <tr>
                <td>商品描述:</td>
                <td>
                <textarea name="description">
                    请输入商品描述信息!~
                </textarea>
                </td>
            </tr>
            <tr>
                <td>所属类别:</td>
                <td>
                    <input id="one" class="easyui-combobox" style="width: 70px"/>
                    <input id="two" name="cid" class="easyui-combobox" style="width: 70px"/>
                </td>
            </tr>
            <tr>
                <td>是否热销:</td>
                <td>
                <input type="text" name="is_hot" class="easyui-validatebox" data-options="required:true"/>
                </td>
            </tr>

           <%-- <tr align="center">
                <td colspan="2">
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       data-options="iconCls:'icon-ok',text:'提交'" id="subAdd"></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       data-options="iconCls:'icon-undo',text:'重置'" id="resetAdd"></a>
                </td>
            </tr>--%>
            </table>
        </form>
    </div>

    <script>
        <%--数据表格 展示所有--%>
        $("#table").datagrid({
            title:'服饰展示',
            fitColumns:true, //自动计算列宽
            columns:[[
                {field:'ck',checkbox:true},
                {field:'pid',title:'商品编号',width:100},
                {field:'image',title:'图片',width:100,
                    formatter:function (value) {
                        return "<img src='"+value+"'width='60'height='70'/>"
                    }},
                {field:'pname',title:'商品名称',width:100},
                {field:'market_price',title:'市场价格',width:100},
                {field:'shop_price',title:'小商品价格',width:100},
                {field:'is_hot',title:'是否热销',width:100},
                {field:'del',title:'操作',width:100,
                    formatter:function(){
                        return '<div style="background-color:#F3F3F3" id="tool1" >'
                            +'<a href="javascript:void(0)" class="easyui-linkbutton" >修改</a>'+'&nbsp;'
                            +'<a href="javascript:void(0)" class="easyui-linkbutton">删除</a></div>';
                    }
                },
                {field:'goodsInfo',title:'商品详情',width:100,
                    formatter:function(){
                        return '<div style="background-color:#F3F3F3" id="tool2" >'
                            +'<a href="javascript:void(0)" class="xiang" >详情</a>'
                            +'</div>';
                    }
                }
            ]],
            url:'product/selectAll.do',
            pagination:true,  //分页工具栏
            loadMsg:'亲~努力加载中，不要着急哦！',
            rownumbers:true,
            striped:true,
            ctrlSelect:true,
            pageList:[5,10,15],
            pageSize:5,
            pageNumber:1,
            toolbar:'#tool',
        });

        <%--下拉框 模糊查询--%>
        $("#sbox").searchbox({
            searcher:function (value,name) {
                $("#table").datagrid('load',{
                    pname:value.trim()
                });
            }
        })

        <%--详情商品--%>
        $("#haha").on("click",".xiang",function () {
            var hang = $("#table").datagrid("getSelected");
            //给表单填充数据
            $("#form").form('load', {
                pid: hang.pid,
                pname: hang.pname,
                market_price: hang.market_price,
                shop_price: hang.shop_price,
                image: hang.image,
                description: hang.description,
                is_hot: hang.is_hot,
                cid: hang.cid
            });
            // 初始化会话窗口
            $("#dialog").dialog({
                title: '详情',
                iconCls: 'icon-save',
                width: 400,
                height: 400,
                modal: true,  //遮盖效果
            })
        })
        <%--修改商品--%>
        $("#updBtn").click(function () {
            var hang = $("#table").datagrid("getSelected");
            if(hang){
                //初始化
                $("#form").form({
                    url:'product/update.do',
                    onSubmit:function (param) {
                        //完成表单验证
                        return $("#form").form('validate');
                    },
                    success:function (r) {
                        //关闭会话框
                        $("#dialog").dialog('close');
                        //同时刷新数据
                        $("#table").datagrid('load');
                    }
                });
                //给表单填充数据
                $("#form").form('load',{
                    pid:hang.pid,
                    pname:hang.pname,
                    market_price:hang.market_price,
                    shop_price:hang.shop_price,
                    image:hang.image,
                    description:hang.description,
                    is_hot:hang.is_hot,
                    cid:hang.cid
                });
                // 初始化会话窗口
                $("#dialog").dialog({
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
                            $("#form").submit();
                        }
                    }]
                })
            }else {
                $.messager.alert('提示','请选择一行','warning');
            }
        });

        <%--添加商品--%>
        $("#addBtn").click(function () {
            <%--类别 二级联动--%>
            $("#one").combobox({
                url:'category/selectByFid.do',
                valueField:'cid',
                textField:'cname',
                onLoadSuccess:function (r) {
                    $("#one").combobox('select',r[1].cid)
                },
                onSelect:function (r) {
                    var parentId = r.cid;

                    $("#two").combobox({
                        url: 'category/selectByFid.do?parentId='+parentId,
                        valueField: 'cid',
                        textField: 'cname',
                        onLoadSuccess: function (r) {
                            $("#two").combobox('select', r[0].cid)
                        }
                    })
                }
            })
            //初始化
            $("#form").form({
                url: 'product/add.do',
                onSubmit: function (param) {
                    //完成表单验证
                    return $("#form").form('validate');
                },
                success: function (r) {
                    console.log(r);
                    //关闭会话框
                    $("#dialog").dialog('close');
                    //同时刷新数据
                    $("#table").datagrid('load');
                }
            });
            // 初始化会话窗口
            $("#dialog").dialog({
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
                        $("#form").submit();
                    }
                }]
            });
        })

        <%--批量删除--%>
        $("#delAllBtn").click(function () {
            var hang = $("#table").datagrid("getSelections");
            var ids = new Array();
            for(var i=0;i<hang.length;i++){
                ids.push(hang[i].pid);
            }
            $.ajax({
                url:'product/deleteByIds.do?ids='+ids,
                success:function (data) {
                    $("#table").datagrid("load");
                }
            })
        })

    </script>
</body>
</html>
