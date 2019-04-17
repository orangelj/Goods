<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/themes/default/easyui.css"/>
    <link rel="stylesheet" href="css/themes/icon.css"/>
</head>

<body>
    <input id="province" class="easyui-combobox"/>
    <input id="city" class="easyui-combobox"/>
    <input id="county" class="easyui-combobox"/>

</body>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.easyui.min.js"></script>
<script>
    $("#province").combobox({
        url:'city/select.do',
        valueField:'id',
        textField:'name',
        onLoadSuccess:function (r) {
            $("#province").combobox('select',r[0].id)
        },
        onSelect:function (r) {
            var parentId = r.id;

            $("#city").combobox({
                url:'city/select.do?parentId='+parentId,
                valueField:'id',
                textField:'name',
                onLoadSuccess:function (r) {
                    $("#city").combobox('select',r[0].id)
                },
                onSelect:function (r) {
                    var parentId = r.id;

                    $("#county").combobox({
                        url:'city/select.do?parentId='+parentId,
                        valueField:'id',
                        textField:'name',
                        onLoadSuccess:function (r) {
                            $("#county").combobox('select',r[0].id)
                        }
                    })
                }
            })
        }
    })
</script>
</html>
