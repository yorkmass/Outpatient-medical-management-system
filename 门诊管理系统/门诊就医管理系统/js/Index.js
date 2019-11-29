//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  界面操作   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


//显示登录注册 或显示登录名.
function showName() {

    var userID = getCookie("userID");
    var userName = "";
    $.ajax({
        url: "/aspx/DataGet.aspx?fn=GetUserName&userID=" + userID + "&ran=" + Math.random(),
        success: function (data) {
            userName = data;
            if (userName != "") {
                $('#loginYes').show(); $('#loginName').html(userName);
                $('#loginNo').hide();
                alertify.error(userName + "您好,欢迎光临!");
                $('#checkProductdiv').show();
            }
            else {
                $('#loginYes').hide()
                $('#loginNo').show();
                $('#checkProductdiv').hide();

            }
        }
    });
}



//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function doLogout() {
    $.ajax({ url: '/Aspx/DataGet.aspx?fn=Logout&ran=' + Math.random(), async: false });//清除Session
    delCookie("userID");//清除Cookie
    showName();
    alertify.error("您已退出登录。");
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//=====================================================================================Common function =====================================
function GetUrlParms() {
    var args = new Object();

    var query = location.search.substring(1);//获取查询串  

    var pairs = query.split("&");//在逗号处断开   

    for (var i = 0; i < pairs.length; i++) {
        var pos = pairs[i].indexOf('=');//查找name=value   

        if (pos == -1) continue;//如果没有找到就跳过   

        var argname = pairs[i].substring(0, pos);//提取name   

        var value = pairs[i].substring(pos + 1);//提取value   

        args[argname] = unescape(value);//存为属性   
    }
    return args;
}

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

