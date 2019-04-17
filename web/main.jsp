<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/themes/default/easyui.css"/>
    <link rel="stylesheet" href="css/themes/icon.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
    <div id="tab" class="easyui-tabs" data-options="region:'center',split:true"></div>

    <div class="easyui-accordion" data-options="region:'west',title:'导航菜单',split:true" style="width: 15%">
        <div data-options="title:'用户管理'"style="text-align: center">
            <div style="margin-top: 10px">
                <a href="#" id="userBtn" class="easyui-linkbutton" data-options="text:'查看用户信息',iconCls:'icon-man',width:150"></a>
            </div>
        </div>
        <div data-options="title:'商品管理'"style="text-align: center">
            <div style="margin-top: 10px">
                <a href="#" id="proBtn" class="easyui-linkbutton" data-options="text:'查看商品信息',iconCls:'icon-search',width:150"></a>
            </div>
        </div>
        <div data-options="title:'类别管理'"style="text-align: center">
            <div style="margin-top: 10px">
                <a href="#" id="catBtn" class="easyui-linkbutton" data-options="text:'类别查询',iconCls:'icon-search',width:150"></a>
            </div>
        </div>
    </div>

    <div data-options="region:'north',split:true" style="position: relative;height: 15%;background-color: rgba(194, 213, 241, 1);">
        <div style="position:absolute;bottom:22px;left:40%;">
            <span style="font-family:楷体;font-weight:bold;font-size:36px;color:#400000;">爱衣 服饰时装展</span>
        </div>
        <div style="position: absolute;bottom: 10px;right: 10px;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-man',text:'欢迎${sessionScope.username}',plain:true"></a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-man',text:'修改用户名',plain:true"></a>
            <a href="javascript:void(0);"class="easyui-linkbutton" data-options="iconCls:'icon-back',text:'修改密码',plain:true"></a>
        </div>
    </div>

    <div data-options="region:'south',split:true"style="height: 10%; text-align: center;background-color: rgba(194, 213, 241, 1);" >
        <div style="position:absolute;bottom:22px;left:45%;">
            <span style="font-weight:bold;font-size:13px;color:#400000;">&copy;爱衣 服饰时装展</span>
        </div>
    </div>
</body>
    <script>
        <%--引用商品页面--%>
        $("#proBtn").click(function () {
            if($("#tab").tabs('exists','服饰展示')){
                $("#tab").tabs('select','服饰展示');
            }else {
                $("#tab").tabs('add',{
                    title:'服饰展示',
                    closable:true,
                    href:'products.jsp'
                })
            }
        })

        <%--引用用户页面--%>
        $("#userBtn").click(function () {
            if($("#tab").tabs('exists','用户信息')){
                $("#tab").tabs('select','用户信息');
            }else {
                $("#tab").tabs('add',{
                    title:'用户信息',
                    closable:true,
                    href:'users.jsp'
                })
            }
        })

        <%--引用类别页面--%>
        $("#catBtn").click(function () {
            if($("#tab").tabs('exists','类别信息')){
                $("#tab").tabs('select','类别信息');
            }else {
                $("#tab").tabs('add',{
                    title:'类别信息',
                    closable:true,
                    href:'category.jsp'
                })
            }
        })
    </script>
</html>
