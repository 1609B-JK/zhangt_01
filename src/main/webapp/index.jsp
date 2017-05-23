<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>

<div id="book_dg" class="easyui-datagrid"></div>

<!-- 设置工具条 -->
<div id="book_tb">
    <!-- 按钮组 -->
    <div class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="open_add_book_dialog()">添加</div>
    <div class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="open_edit_book_dialog()">修改</div>
    <div class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" onclick="delete_selected_row()">删除</div>
</div>

<script type="text/javascript">
    //初始化数据表格
    $("#book_dg").datagrid({
        url:"<%=request.getContextPath() %>/selectBookList.jhtml",
        //pagination:true,
        // pageSize:3,
        //pageList:[3,5,8,10],
        ctrlSelect:true,
        //工具栏
        toolbar:"#book_tb",
        columns:[[
            {field:"bookID",title:"id",width:500},
            {field:"bookName",title:"名称",width:500},
        ]]
    })

    //打开添加对话框
    function open_add_book_dialog() {
        var add_book_dialog = $("<div style='padding:5px'></div>").dialog({
            title:"添加用户",
            height:220,
            width:300,
            modal:true,
            buttons:[
                {
                    text:"保存",
                    handler:function() {
                        //获取表单中的值，并且拼成json对象
                        var add_name = $("#book_name").textbox("getValue");

                        var add_book_json = {
                            bookName:add_name,
                        }
                        //ajax获取到表单并提交
                        $.post(
                                "<%=request.getContextPath() %>/insertBook.jhtml",
                                add_book_json,
                                function(data) {
                                    //关闭对话框
                                    add_book_dialog.dialog("destroy");
                                    //刷新数据表格
                                    $("#book_dg").datagrid("load");
                                },
                                "json"
                        );
                    }},
                {
                    text:"取消",
                    handler:function(node) {
                        //关闭对话框
                        add_book_dialog.dialog("destroy");
                    }
                }
            ]
        });
        add_book_dialog.window({
            href:"<%=request.getContextPath() %>/toAddBookPage.jhtml"
        });
    }

    //删除
    function delete_selected_row(){
        //获取选中的行
        var deleteBookByID = $("#book_dg").datagrid("getSelected");

        if (deleteBookByID) {
            //提示是否删除
            $.messager.confirm("删除","是否删除选中的数据",function(f) {
                if (f) {
                    //ajax请求后台进行删除
                    $.ajax({
                        url: "<%=request.getContextPath() %>/deleteBook.jhtml?bookID="+deleteBookByID.bookID,
                        type: "get",
                        dataType: "json",
                        success: function (data) {
                            //重新加载数据表格
                            $("#book_dg").datagrid("reload");
                        }
                    });
                }
            });
        }
    }

    //打开修改对话框
    function open_edit_book_dialog() {
        //获取选中的数据
        var edit_book_data = $("#book_dg").datagrid("getSelected");

        if (edit_book_data) {
            var edit_book_dialog = $("<div style='padding:5px'></div>").dialog({
                title:"修改用户信息",
                height:220,
                width:300,
                modal:true,
                buttons:[
                    {
                        text:"保存",
                        handler:function() {
                            //获取表单中的值，并且拼成json对象
                            var edit_book_id = $("#edit_book_id").val();
                            var edit_book_name = $("#edit_book_name").textbox("getValue");

                            var edit_book_json = {
                                bookID:edit_book_id,
                                bookName:edit_book_name,
                            }
                            //ajax获取到表单并提交
                            $.post(
                                    "<%=request.getContextPath() %>/updateBookByID.jhtml",
                                    edit_book_json,
                                    function(data) {
                                        //关闭对话框
                                        edit_book_dialog.dialog("destroy");
                                        //刷新数据表格
                                        $("#book_dg").datagrid("reload");
                                    },
                                    "json"
                            );
                        }},
                    {
                        text:"取消",
                        handler:function() {
                            //关闭对话框
                            edit_book_dialog.dialog("destroy");
                        }
                    }
                ],
            });
            edit_book_dialog.window({
                href:"<%=request.getContextPath() %>/toEditBookPage.jhtml?bookID=" + edit_book_data.bookID
            });
        } else {
            $.messager.alert("提示","请至少选择一条");
        }
    }
</script>
</body>
</html>