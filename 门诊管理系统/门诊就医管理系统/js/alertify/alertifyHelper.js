/*
此处依赖alertify.js
*/
alertify.set({ delay: 5000 });
alertify.warning = alertify.extend('warning');


/*
提示组件
*/
var msg = {
    alert:function(message) {
        alertify.alert(message);
    },
    ok: function(message) {
        alertify.success(message);
    },
    error: function(message) {
        alertify.error(message);
    },
    warning: function(message) {
        alertify.warning(message);
    },
    showMsg: function(title, msg, isAlert) {
        if (isAlert !== undefined && isAlert) {
            $.messager.alert(title, msg);
        } else {
            $.messager.show({
                title: title,
                msg: msg,
                showType: 'show'
            });
        }
    },
    showConfirm: function(title, msg, callback) {
        $.messager.confirm(title, msg, function(r) {
            if (r) {
                if (jQuery.isFunction(callback))
                    callback.call();
            }
        });
    },
    showProcess: function(isShow, title, msg) {
        if (!isShow) {
            $.messager.progress('close');
            return;
        }
        var win = $.messager.progress({
            title: title,
            msg: msg
        });
    }
};