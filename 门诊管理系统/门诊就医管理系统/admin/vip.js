var htmlSrc = '/admin/vipAdd.html';

$(function () {

    $('#a_add').click(grid.add);
    $('#a_edit').click(grid.edit);
    $('#a_delete').click(grid.del);
    $("#a_refresh").click(grid.refresh);

    grid.bind();

    $('#divCenter').resize(function () {
        $('#listTable').datagrid({ width: $('#divCenter').width() });
    })
});



var grid = {
    bind: function () {

        $('#listTable').datagrid({
            //pidtype 1标识pid在数据库中为字符类型，其他表示pid字段在数据库中是其他类型，例如整数类型
            url: '/ajax/DataGridData.aspx',
            queryParams: {
                fn: 'select',
                table: 'Vip',
                keyfield: 'VipID',
                sort: 'VipPrice',
                where: ' RecordID<>-1'
            },

            toolbar: '#divTools',
            iconCls: 'icon icon-list',
            fit: true,
            nowrap: false, //折行
            rownumbers: true, //行号
            striped: true, //隔行变色
            idField: 'VipID',//主键
            singleSelect: true, //单选
            columns: [[
                { title: '会员编号', field: 'VipID', width: 120 },
                { title: 'VIP等级', field: 'VipRole', width: 120 },
                { title: 'VIP状态', field: 'VipSta', width: 60, align: 'center' },
                { title: 'VIP价格', field: 'VipPrice', width: 60, align: 'center' }
			  
            ]],
            pagination: false,
            onLoadSuccess: function (data) {
                if (data.total == 0) {
                    $('#listTable').datagrid("deleteRow", 0);
                    var body = $(this).data().datagrid.dc.body2;
                    body.find('table tbody').append('<tr><td width="' + body.width() + '" style="height: 25px; text-align: center;" colspan="10">没有数据</td></tr>');
                }
            }
        });
    },
    getSelectedRow: function () {
        return $('#listTable').datagrid('getSelected');
    },
    reload: function () {
        $('#listTable').datagrid('clearSelections').datagrid('reload');
    },

    add: function () {
        var hDialog = top.jQuery.hDialog({
            title: '添加', width: 350, height: 300, href: htmlSrc, iconCls: 'icon-add',
            onLoad: function ()
            {
            },
            submit: function () {
                var bform = $("#form1").form('validate');
                if (!bform) return;

                var query = top.$("#form1").serializeArray();   //aspnetForm//uiformLinkMan
                query = convertArray(query);
                if (query.Sort == "") query.Sort = "0";   //如果数字型为空则会出错, 需要给个默认值0.

                var s = JSON.stringify(query);

                $.ajax({
                    url: encodeURI('/ajax/DataGridData.aspx?fn=add&table=Vip&idName=VipID&query=' + s + "& t=" + Math.random()),
                    success: function (data) {
                        alertify.error(data);
                        if (data == "操作成功") {
                            grid.reload();
                            hDialog.dialog('close');
                        }
                    }
                });
            }
        });

    },
    edit: function () {
        var row = grid.getSelectedRow();
        if (row) {
            var hDialog = top.jQuery.hDialog({
                title: '修改', width: 350, height: 300, href: htmlSrc, iconCls: 'icon-save',
                onLoad: function () {

                    top.$('#txt_VipID').val(row.VipID);
                    top.$('#txt_VipRole').val(row.VipRole);
                    top.$('#txt_VipPrice').val(row.VipPrice);
                    top.$('#txt_VipSta').val(row.VipSta);
                },
                submit: function () {
                    var bform = $("#form1").form('validate');
                    if (!bform) return;

                    var query = top.$("#form1").serializeArray();   //aspnetForm//uiformLinkMan
                    query = convertArray(query);
                    if (query.Sort == "") query.Sort = "0";   //如果数字型为空则会出错, 需要给个默认值0.
                    var s = JSON.stringify(query);

                    $.ajax({
                        url: encodeURI('/ajax/DataGridData.aspx?fn=update&idName=VipID&oldID='+row.VipID+'&table=Vip&query=' + s + "& t=" + Math.random()),
                        success: function (data) {
                            alertify.error(data);
                            if (data == "操作成功") {
                                grid.reload();
                                hDialog.dialog('close');
                            }
                        }
                    });
                }
            });

        } else {
            alertify.error('请选择要修改的行。');
        }
    },
    del: function () {
        var row = grid.getSelectedRow();
        if (row) {
            if (confirm('确实要删除【' + row.VipRole + '】?')) {
                var rid = row.VipID;
                $.ajax({
                    url: encodeURI('/ajax/DataGridData.aspx?fn=delete&idName=VipID&table=Vip&id=' + rid + "& t=" + Math.random()),
                    success: function (data) {
                        alertify.error(data);
                        if (data == "操作成功") {
                            grid.reload();
                        }
                    }
                });
            }
        } else {
            alertify.error('请选择要删除的行。');
        }
    },
    refresh: function () {
        grid.reload();
    }
};

//////////////////////////////////////////////////////////
function convertArray(o) {
    var v = {};
    for (var i in o) {
        if (o[i].name != '__VIEWSTATE') {
            if (typeof (v[o[i].name]) == 'undefined')
                v[o[i].name] = o[i].value;
            else
                v[o[i].name] += "," + o[i].value;
        }
    }
    return v;
}
