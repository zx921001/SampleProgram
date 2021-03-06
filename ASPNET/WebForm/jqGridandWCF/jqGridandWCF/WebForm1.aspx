﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="jqGridandWCF.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/themes/base/all.css" rel="stylesheet" />
    <link href="Content/jquery.jqGrid/ui.jqgrid.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.1.3.min.js"></script>
    <script src="Scripts/jquery-ui-1.11.2.min.js"></script>
    <script src="Scripts/i18n/grid.locale-ja.js"></script>
    <script src="Scripts/jquery.jqGrid.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#list').jqGrid({
                datatype: 'json',
                url: 'JSONService.svc/GetJson',
                colNames: ['id', 'name', 'email', 'phone'],
                colModel: [
                    { name: 'id' },
                    { name: 'name', sortable: false },
                    { name: 'email', sortable: false },
                    { name: 'phone', sortable: false }
                ],
                rowNum: 1000,
                loadonce: false,
                caption: 'JSON Sample (ページングなし)'
            });

            $('#list2').jqGrid({
                datatype: 'json',
                url: 'JSONService.svc/GetJson',
                colNames: ['id', 'name', 'email', 'phone'],
                colModel: [
                    { name: 'id' },
                    { name: 'name', sortable: false },
                    { name: 'email', sortable: false },
                    { name: 'phone', sortable: false }
                ],
                pager: $('#pager'),
                rowNum: 10,
                viewrecords: true,
                gridview: true,
                loadonce: false,
                beforeProcessing: function (data, status, xhr) {  // レスポンスの受信時に呼び出されるイベント
                    // サーバからエラーが返ってきた場合にダイアログを表示し、以降の処理を中止する
                    // エラー時には、サーバからuserdataに情報を格納する
                    if (data.userdata == "error") {
                        alert("最大ページ以上を指定しています");
                        return false;
                    }
                },
                caption: 'JSON Sample (ページングあり)'
            });
            $('#list2').navGrid('#pager', { del: false, add: false, edit: false, search: true, refresh: true });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="list"></table>
        <br />
        <table id="list2"></table>
        <div id ="pager"></div>
    </div>
    </form>
</body>
</html>
