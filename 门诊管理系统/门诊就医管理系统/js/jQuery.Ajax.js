
/*
在jquery的ajax函数中，可以传入3种类型的数据
1.文本："uname=alice&mobileIpt=110&birthday=1983-05-12" 第用url传参，参数里面如果加带"&"这个符号的话，可能参数接收不到或不完整，如“ data: "name=John&location=Boston",”，
2.json对象：{uanme:'vic',mobileIpt:'110',birthday:'2013-11-11'} 如果用data: {name:john,location:boston}这种方式写地话就不需要进行转义
3.json数组：
[
    {"name":"uname","value":"alice"},
    {"name":"mobileIpt","value":"110"},   
    {"name":"birthday","value":"2012-11-11"}
]
4.当前台没有传递参数到后台时，data可以不用写，或用data:{}代替
5.如果为数组，jQuery 将自动为不同值对应同一个名称。data: {foo:[bar1, bar2]} 转换为 '&foo=bar1&foo=bar2'
6.jquery.ajax请求webservice的时候,data必须要以字符串的形式表示JSON，而不能直接用JSON数据传进去。data: "{'name':'zhangsan'}" 注意,此处有双引号包裹
  可以采用GetJsonString/JsonToString/JsonToString2等方法转化json对象.
  不过,首先需要定义json对象才行哦.json对象格式如24行.
7.提取表单数据的话只需要serialize()方法直接获取"uname=alice&mobileIpt=110&birthday=1983-05-12"

8.WebService.cs中需要注意:
需要把[System.Web.Script.Services.ScriptService]解除注释状态,否则jquery无法调用指定方法

9.在前台js方法中向后台webservice提交方法的时候,参数名称需要完全一致,类型最好一致,否则对应不上

*/


/*
    @jsonObj 这个参数是json对象,例如下所示:
        var jsonObj = {
        "qq":"321321321",
        "MSN":"asdf@asdf.com",
        "Tel":"0852-8888888"
    };
*/
function GetJsonString(jsonObj) {
    var jStr = "{ ";
    for (var item in jsonObj) {
        jStr += "'" + item + "':'" + jsonObj[item] + "',";
    }
    jStr += " }";
    return jStr;
}

/*
    同样是json对象转化为json字符串,这个是采用正则方法
*/
function JsonToString(o) {
    var arr = [];
    var fmt = function(s) {
        if (typeof s == 'object' && s != null) return JsonToStr(s);
        return /^(string|number)$/.test(typeof s) ? "'" + s + "'" : s;
    };
    for (var i in o)
        arr.push("'" + i + "':" + fmt(o[i]));
    return '{' + arr.join(',') + '}';
}

/*
    同样是json对象转化为json字符串,这个是采用正则方法
*/
function JsonToString2(o) {
    var arr = [];
    var fmt = function (s) {
        if (typeof s == 'object' && s != null) return JsonToString2(s);
        return /^(string)$/.test(typeof s) ? "'" + s + "'" : s;
    };
    for (var i in o)
        arr.push("'" + i + "':" + fmt(o[i]));
    return '{' + arr.join(',') + '}';
}

/*
js对象转化为字符串,貌似不能处理日期型
*/
function obj2str(o) {
    var r = [];
    if (typeof o == "string" || o == null) {
        return o;
    }
    if (typeof o == "object") {
        if (!o.sort) {
            r[0] = "{";
            for (var i in o) {
                r[r.length] = i;
                r[r.length] = ":";
                r[r.length] = obj2str(o[i]);
                r[r.length] = ",";
            }
            r[r.length - 1] = "}";
        } else {
            r[0] = "[";
            for (var i = 0; i < o.length; i++) {
                r[r.length] = obj2str(o[i]);
                r[r.length] = ",";
            }
            r[r.length - 1] = "]";
        }
        return r.join("");
    }
    return o.toString();
}

/*
    返回json对象
*/
function getJSONObj(jsonstr) {
    var result = eval('(' + jsonstr + ')');
    return result;
}

/*
重写Date对象的prototype的toJSON方法，返回自定义时间格式 本地时间
*/
Date.prototype.toJSON = function() { return this.toLocaleString(); };

/**
 * ajax封装，默认值均为null即可
 * url 发送请求的地址
 * data 发送到服务器的数据，数组存储，如：{"date": new Date().getTime(), "state": 1}
 * async 默认值: true。默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false。,默认值可以设置为null
 *       注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。javascript存在自动转型特性
 * type 请求方式("POST" 或 "GET")， 默认为 "Post",默认值可以设置为null
 * dataType 预期服务器返回的数据类型，常用的如：xml、html、json、text,默认值为json
 * successfn 成功回调函数
 * errorfn 失败回调函数
 * beforefn loading函数
 * completefn 完成函数
 * timeout 超时 默认20000毫秒 20秒

    完成函数中可以判断是否超时
    complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
        if(status=='timeout'){//超时,status还有success,error等值的情况
            ajaxTimeoutTest.abort();
            alert("超时");
        }
 
    错误回调函数
    error：function (XMLHttpRequest, textStatus, errorThrown) 
    { 
    } 
    (默 认: 自动判断 (xml 或 html)) 请求失败时调用时间。
    参数有以下三个：XMLHttpRequest 对象、错误信息、（可选）捕获的错误对象。
    如果发生了错误，错误信息（第二个参数）除了得到null之外，还可能是"timeout", "error", "notmodified" 和 "parsererror"。

    注意:
    1.当jquery Ajax使用get或post 方式请求ashx或者aspx的时候，提交的是Json对象而不是json字符串。这与WebService不同。
    2.当Jquery Ajax使用post方式请求ashx或者aspx获取json格式数据时“contentType: 'application/json;charset=utf-8'” 此属性不能显示指定，否则，后台Request获取不到键值对。
    3.对应ashx文件一般不需要显示指定返回值类型，context.Response.ContentType = "application/json"; 等。
    4.当返回json格式数据时，应当是类似 ResponseText("{\"language\":\"" + chinese + "\"}");的否则前台jquery自动解析出错。
 */
$.myajax = function (url, data, successfn, errorfn, beforefn, completefn, timeout, async, type, dataType) {
    data = (data == null || data == "" || typeof (data) == "undefined") ? { "date": new Date().getTime() } : data;
    async = (async == null || typeof (async) == "undefined") ? true : async;
    type = (type == null || type == "" || typeof (type) == "undefined") ? "post" : type;
    dataType = (dataType == null || dataType == "" || typeof (dataType) == "undefined") ? "text" : dataType;
    successfn = (successfn == null || successfn == "" || typeof (successfn) == "undefined") ? function () { } : successfn;
    errorfn = (errorfn == null || errorfn == "" || typeof (errorfn) == "undefined") ? function () { } : errorfn;
    beforefn = (beforefn == null || beforefn == "" || typeof (beforefn) == "undefined") ? function () { } : beforefn;
    completefn = (completefn == null || completefn == "" || typeof (completefn) == "undefined") ? function () { } : completefn;
    timeout = (timeout == null || timeout == "" || typeof (timeout) == "undefined") ? 20000 : timeout;
    $.ajax({
        type: type,
        async: async,
        data: data,
        url: url,
        dataType: dataType,
        //contentType: "application/json; charset=utf-8",
        cache: false,
        success: function (d) {
            successfn(d);
        },
        error: function (e, textStatus) {
            errorfn(e, textStatus);
        },
        beforeSend: function (c) {
            beforefn(c);
        },
        complete: function (f, s) {
            completefn(f, s);
        }
    });
};

/*
可以供使用的myajax的错误调试方法

XMLHttpRequest.readyState: 状态码的意思
0 － （未初始化）还没有调用send()方法
1 － （载入）已调用send()方法，正在发送请求
2 － （载入完成）send()方法执行完成，已经接收到全部响应内容
3 － （交互）正在解析响应内容
4 － （完成）响应内容解析完成，可以在客户端调用了

XMLHttpRequest.status

·0 - 本地响应成功。

　· 100 - Continue 初始的请求已经接受，客户应当继续发送请求的其余部分。（HTTP 1.1新） 
　· 101 - Switching Protocols 服务器将遵从客户的请求转换到另外一种协议（HTTP 1.1新） 

2xx - 成功

这类状态代码表明服务器成功地接受了客户端请求。
　· 200 - OK 一切正常，对GET和POST请求的应答文档跟在后面。 
　· 201 - Created 服务器已经创建了文档，Location头给出了它的URL。 
　· 202 - Accepted 已经接受请求，但处理尚未完成。 
　· 203 - Non-Authoritative Information 文档已经正常地返回，但一些应答头可能不正确，因为使用的是文档的拷贝，非权威性信息（HTTP 1.1新）。
　· 204 - No Content 没有新文档，浏览器应该继续显示原来的文档。如果用户定期地刷新页面，而Servlet可以确定用户文档足够新，这个状态代码是很有用的。 
　· 205 - Reset Content 没有新的内容，但浏览器应该重置它所显示的内容。用来强制浏览器清除表单输入内容（HTTP 1.1新）。 
　· 206 - Partial Content 客户发送了一个带有Range头的GET请求，服务器完成了它（HTTP 1.1新）。 

3xx - 重定向

客户端浏览器必须采取更多操作来实现请求。例如，浏览器可能不得不请求服务器上的不同的页面，或通过<a id="vad_2" onmouseover="if(typeof(showTitle)!='undefined'){this.title='';window.clearTimeout(hideTO);showTitle(event, this, 2,'');}" title="网络游戏没攻略？ @Vogate.com" style="font-size: 1em" onclick="" onmouseout="if(typeof(showTitle)!='undefined'){mouseIsOverLayer = false; mouseOverWhileLoad = false; hideTO = window.setTimeout('checkIfMouseOverLayer()',500);}" href="http://action.vogate.com/click/click.php?ads_id=3503&site_id=6235007045040803&click=1&url=http%3A//www.766.com%7C%u73A9%u6E38%u620F%u641E%u4E0D%u5B9A%u653B%u7565%u600E%u4E48%u529E%uFF1F%3Bhttp%3A//pao.766.com%7C%u8DD1%u8DD1%u5361%u4E01%u8F66%u624B%u628A%u624B%u6559%u4F60%u6F02%u79FB%u7EDD%u62DB%uFF01%3Bhttp%3A//www.ro2x.com%7C%u4F60%u7EDD%u5BF9%u6CA1%u770B%u8FC7%u8FD9%u4E48%u5F3A%u7684RO2%u6570%u636E%u5E93%uFF01%3Bhttp%3A//tu.766.com%7C%u4E3A%u4EC0%u4E48%u6BCF%u5929%u90FD%u6709%u8FD9%u4E48%u591A%u7537%u4EBA%u6765%u8FD9%u91CC%uFF1F%3Bhttp%3A//chd.766.com%7C%u73A9%u5F69%u8679%u5C9B%u6765%u8FD9%u91CC%u770B%u3002%u8981%u4EC0%u4E48%u6709%u4EC0%u4E48%uFF01&v=0&k=%u4EE3%u7406&s=http%3A//www.023si.com/html/79/t-13279.html&rn=942481" target="_blank">代理服务器重复该请求。
　· 300 - Multiple Choices 客户请求的文档可以在多个位置找到，这些位置已经在返回的文档内列出。如果服务器要提出优先选择，则应该在Location应答头指明。 
　· 301 - Moved Permanently 客户请求的文档在其他地方，新的URL在Location头中给出，浏览器应该自动地访问新的URL。 
　· 302 - Found 类似于301，但新的URL应该被视为临时性的替代，而不是永久性的。注意，在HTTP1.0中对应的状态信息是“Moved Temporatily”。出现该状态代码时，浏览器能够自动访问新的URL，因此它是一个很有用的状态代码。注意这个状态代码有时候可以和301替换使用。例如，如果浏览器错误地请求 http://host/~user （缺少了后面的斜杠），有的服务器返回301，有的则返回302。严格地说，我们只能假定只有当原来的请求是GET时浏览器才会自动重定向。请参见307。 
　· 303 - See Other 类似于301/302，不同之处在于，如果原来的请求是POST，Location头指定的重定向目标文档应该通过GET提取（HTTP 1.1新）。 
　· 304 - Not Modified 客户端有缓冲的文档并发出了一个条件性的请求（一般是提供If-Modified-Since头表示客户只想比指定日期更新的文档）。服务器告诉客户，原来缓冲的文档还可以继续使用。
　· 305 - Use Proxy 客户请求的文档应该通过Location头所指明的代理服务器提取（HTTP 1.1新）。 
　· 307 - Temporary Redirect 和302（Found）相同。许多浏览器会错误地响应302应答进行重定向，即使原来的请求是POST，即使它实际上只能在POST请求的应答是303时才能重定向。由于这个原因，HTTP 1.1新增了307，以便更加清除地区分几个状态代码：当出现303应答时，浏览器可以跟随重定向的GET和POST请求；如果是307应答，则浏览器只能跟随对GET请求的重定向。（HTTP 1.1新） 

4xx - 客户端错误

发生错误，客户端似乎有问题。例如，客户端请求不存在的页面，客户端未提供有效的身份验证信息。

　· 400 - Bad Request 请求出现语法错误。 
　· 401 - Unauthorized 访问被拒绝，客户试图未经授权访问受密码保护的页面。应答中会包含一个WWW-Authenticate头，浏览器据此显示用户名字/密码对话框，然后在填写合适的Authorization头后再次发出请求。IIS 定义了许多不同的 401 错误，它们指明更为具体的错误原因。这些具体的错误代码在浏览器中显示，但不在 IIS 日志中显示：
　· 401.1 - 登录失败。
　· 401.2 - 服务器配置导致登录失败。
　· 401.3 - 由于 ACL 对资源的限制而未获得授权。
　· 401.4 - 筛选器授权失败。
　· 401.5 - ISAPI/CGI 应用程序授权失败。
　· 401.7 – 访问被 Web 服务器上的 URL 授权策略拒绝。这个错误代码为 IIS 6.0 所专用。
　· 403 - Forbidden 资源不可用。服务器理解客户的请求，但拒绝处理它。通常由于服务器上文件或目录的权限设置导致。禁止访问：IIS 定义了许多不同的 403 错误，它们指明更为具体的错误原因：
　· 403.1 - 执行访问被禁止。
　· 403.2 - 读访问被禁止。
　· 403.3 - 写访问被禁止。
　· 403.4 - 要求 SSL。
　· 403.5 - 要求 SSL 128。
　· 403.6 - IP 地址被拒绝。
　· 403.7 - 要求客户端证书。
　· 403.8 - 站点访问被拒绝。
　· 403.9 - 用户数过多。
　· 403.10 - 配置无效。
　· 403.11 - 密码更改。
　· 403.12 - 拒绝访问映射表。
　· 403.13 - 客户端证书被吊销。
　· 403.14 - 拒绝目录列表。
　· 403.15 - 超出客户端访问许可。
　· 403.16 - 客户端证书不受信任或无效。
　· 403.17 - 客户端证书已过期或尚未生效。
　· 403.18 - 在当前的应用程序池中不能执行所请求的 URL。这个错误代码为 IIS 6.0 所专用。
　· 403.19 - 不能为这个应用程序池中的客户端执行 CGI。这个错误代码为 IIS 6.0 所专用。
　· 403.20 - Passport 登录失败。这个错误代码为 IIS 6.0 所专用。
　· 404 - Not Found 无法找到指定位置的资源。这也是一个常用的应答。 
　· 404.0 -（无） – 没有找到文件或目录。
　· 404.1 - 无法在所请求的端口上访问 Web 站点。
　· 404.2 - Web 服务扩展锁定策略阻止本请求。
　· 404.3 - MIME 映射策略阻止本请求。

　· 405 - Method Not Allowed 请求方法（GET、POST、HEAD、DELETE、PUT、TRACE等）对指定的资源不适用，用来访问本页面的 HTTP 谓词不被允许（方法不被允许）（HTTP 1.1新） 
　· 406 - Not Acceptable 指定的资源已经找到，但它的MIME类型和客户在Accpet头中所指定的不兼容，客户端浏览器不接受所请求页面的 MIME 类型（HTTP 1.1新）。 
　· 407 - Proxy Authentication Required 要求进行代理身份验证，类似于401，表示客户必须先经过代理服务器的授权。（HTTP 1.1新） 
　· 408 - Request Timeout 在服务器许可的等待时间内，客户一直没有发出任何请求。客户可以在以后重复同一请求。（HTTP 1.1新）
　· 409 - Conflict 通常和PUT请求有关。由于请求和资源的当前状态相冲突，因此请求不能成功。（HTTP 1.1新） 
　· 410 - Gone 所请求的文档已经不再可用，而且服务器不知道应该重定向到哪一个地址。它和404的不同在于，返回407表示文档永久地离开了指定的位置，而404表示由于未知的原因文档不可用。（HTTP 1.1新） 
　· 411 - Length Required 服务器不能处理请求，除非客户发送一个Content-Length头。（HTTP 1.1新） 
　· 412 - Precondition Failed 请求头中指定的一些前提条件失败（HTTP 1.1新）。
　· 413 – Request Entity Too Large 目标文档的大小超过服务器当前愿意处理的大小。如果服务器认为自己能够稍后再处理该请求，则应该提供一个Retry-After头（HTTP 1.1新）。 
　· 414 - Request URI Too Long URI太长（HTTP 1.1新）。 
　· 415 – 不支持的媒体类型。
　· 416 – Requested Range Not Satisfiable 服务器不能满足客户在请求中指定的Range头。（HTTP 1.1新） 
　· 417 – 执行失败。
　· 423 – 锁定的错误。

5xx - 服务器错误

服务器由于遇到错误而不能完成该请求。

　· 500 - Internal Server Error 服务器遇到了意料不到的情况，不能完成客户的请求。 
　· 500.12 - 应用程序正忙于在 Web 服务器上重新启动。
　· 500.13 - Web 服务器太忙。
　· 500.15 - 不允许直接请求 Global.asa。
　· 500.16 – UNC 授权凭据不正确。这个错误代码为 IIS 6.0 所专用。
　· 500.18 – URL 授权存储不能打开。这个错误代码为 IIS 6.0 所专用。
　· 500.100 - 内部 ASP 错误。
　· 501 - Not Implemented 服务器不支持实现请求所需要的功能，页眉值指定了未实现的配置。例如，客户发出了一个服务器不支持的PUT请求。
　· 502 - Bad Gateway 服务器作为网关或者代理时，为了完成请求访问下一个服务器，但该服务器返回了非法的应答。 亦说Web 服务器用作网关或代理服务器时收到了无效响应。
　· 502.1 - CGI 应用程序超时。
　· 502.2 - CGI 应用程序出错。
　· 503 - Service Unavailable 服务不可用，服务器由于维护或者负载过重未能应答。例如，Servlet可能在数据库连接池已满的情况下返回503。服务器返回503时可以提供一个Retry-After头。这个错误代码为 IIS 6.0 所专用。
　· 504 - Gateway Timeout 网关超时，由作为代理或网关的服务器使用，表示不能及时地从远程服务器获得应答。（HTTP 1.1新） 。
  · 505 - HTTP Version Not Supported 服务器不支持请求中所指明的HTTP版本。（

*/
$.myajax.errorfn = function(XMLHttpRequest, textStatus, errorThrown) {
    alert(XMLHttpRequest.status);
    alert(XMLHttpRequest.readyState);
    alert(textStatus);
};

/*
可以供调试使用的完成函数
*/
$.myajax.completefn = function(XMLHttpRequest, status) { //请求完成后最终执行参数
    if (status == 'timeout') { //超时,status还有success,error等值的情况
        alert("超时");
    }
};


$.ajaxjson = function(url, dataMap, fnSuccess) {
    $.ajax({
        type: "POST",
        url: url,
        data: dataMap,
        dataType: "json",
        //contentType: "application/json;charset=utf-8",//----------在ajax请求ashx文件的json数据时，此属性不能被指定，而在请求webservices时，是必须指定的。
        beforeSend: function() { top.$.hLoading.show(); },
        timeout: 10000, //超时时间设置，单位毫秒
        complete: function (XMLHttpRequest, textStatus) {
            top.$.hLoading.hide();
            if (textStatus == 'timeout') {//超时,status还有success,error等值的情况
                alert("超时");
            }
        },
        success: fnSuccess
    });
};

$.ajaxjson = function(url, dataMap, fnSuccess, fnError) {
    $.ajax({
        type: "POST",
        url: url,
        //要发送的数据
        data: dataMap,
        
        //返回json格式的数据
        dataType: "json",
        //contentType: "application/json;charset=utf-8",// ----------在ajax请求ashx文件的json数据时，此属性不能被指定，而在请求webservices时，是必须指定的。
        beforeSend: function () { top.$.hLoading.show(); },
        timeout: 10000, //超时时间设置，单位毫秒
        complete: function (XMLHttpRequest, textStatus) {
            top.$.hLoading.hide();
            if (textStatus == 'timeout') {//超时,status还有success,error等值的情况
                alert("超时");
            }
        },
        success: fnSuccess,
        error: fnError
    });
};



$.ajaxtext = function(url, dataMap, fnSuccess) {
    $.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json;charset=utf-8",// ----------在ajax请求ashx文件的json数据时，此属性不能被指定，而在请求webservices时，是必须指定的。
        data: dataMap,
        beforeSend: function () { top.$.hLoading.show(); },
        timeout: 10000, //超时时间设置，单位毫秒
        complete: function(XMLHttpRequest, textStatus) {
            top.$.hLoading.hide();
            if (textStatus == 'timeout') {//超时,status还有success,error等值的情况
                alert("超时");
            }
        },
        success: fnSuccess
    });
};





//重置大小

function autoResize(options) {
    
    /*
    json对象，默认值
    */
    var defaults = {
        width: 5,
        height: 10,
        gridType: 'jqgrid'
    };
    options = $.extend(defaults, options);

    // 第一次调用
    var wsize = getWidthAndHeigh();
    if ($.isFunction(options.callback)) {
        options.callback(wsize);
    }

    // 窗口大小改变的时候
    $(window).resize(function() {
        var size = getWidthAndHeigh(true);
        switch (options.gridType) {
        case "datagrid":
            $(options.dataGrid).datagrid('resize', { width: size.width, height: size.height });
            break;
        case "treegrid":
            $(options.dataGrid).treegrid('resize', { width: size.width, height: size.height });
            break;
        case "jqgrid":
            $(options.dataGrid).jqGrid('setGridHeight', size.height).jqGrid('setGridWidth', wsize.width);
            break;
        case "layout":
            $(options.dataGrid).layout('resize', { width: size.width, height: size.height });
            break;
            
        }
    });

    // 获取iframe大小

    function getWidthAndHeigh(resize) {
        var windowHeight = 0;
        var widowWidth = 0;
        if (typeof(window.innerHeight) == 'number') {
            windowHeight = window.innerHeight;
            widowWidth = window.innerWidth;
        } else {
            if (document.documentElement && document.documentElement.clientHeight) {
                windowHeight = document.documentElement.clientHeight;
                widowWidth = document.documentElement.clientWidth;
            } else {
                if (document.body && document.body.clientHeight) {
                    windowHeight = document.body.clientHeight;
                    widowWidth = document.body.clientWidth;
                }
            }
        }


        widowWidth -= options.width;
        windowHeight -= options.height;


        return { width: widowWidth, height: windowHeight };
    }
}




//表单元素转JSON
$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};
//var obj = $('form').serializeObject();
/*obj: Object
UserId: "UserId1"
UserName: "UserName1"
__proto__: Object*/


//表单，元素转Name,Value数组
var arrrrr = $("#fm, #UserId").serializeArray();
/*[ 
     {name: 'UserName', value: '"UserName"1'}, 
     {name: 'UserId', value: 'UserId'}
  ] */

//表单元素转QueryString
var qqq = $('#fm, #UserId').serialize();
//qqq = UserName=UserName1&UserId=UserId1

function _StringFormatInline() {
    var txt = this;
    for (var i = 0; i < arguments.length; i++) {
        var exp = new RegExp('\\{' + (i) + '\\}', 'gm');
        txt = txt.replace(exp, arguments[i]);
    }
    return txt;
}

function _StringFormatStatic() {
    for (var i = 1; i < arguments.length; i++) {
        var exp = new RegExp('\\{' + (i - 1) + '\\}', 'gm');
        arguments[0] = arguments[0].replace(exp, arguments[i]);
    }
    return arguments[0];
}

if (!String.prototype.format) {
    String.prototype.format = _StringFormatInline;
}

if (!String.format) {
    String.format = _StringFormatStatic;
}

//主要是推荐这个函数。它将jquery系列化后的值转为name:value的形式。

function convertArray(o) {
    var v = {};
    for (var i in o) {
        if (o[i].name != '__VIEWSTATE') {
            if (typeof(v[o[i].name]) == 'undefined')
                v[o[i].name] = o[i].value;
            else
                v[o[i].name] += "," + o[i].value;
        }
    }
    return v;
}


/* 
   var formArray = $("form").serializeArray(); 
   以下是序列化后的结果数组formArray的内容：
[
    { name: "uid", value: "1" },
    { name: "username", value: "张三" },
    { name: "password", value: "123456" },
    { name: "grade", value: "3" },
    { name: "sex", value: "1" },
    { name: "hobby", value: "1" },
    { name: "hobby", value: "2" }
];
*/


/*
随机字符串 
length : 字符串长度
*/

function randomString(length) {
    var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    var size = length || 8;
    var i = 1;
    var ret = "";
    while (i <= size) {
        var max = chars.length - 1;
        var num = Math.floor(Math.random() * max);
        var temp = chars.substr(num, 1);
        ret += temp;
        i++;
    }
    return ret;
}


function MessageOrRedirect(d) {
    if (d) {
        if (d.Data == "-99")
            top.$.hLoading.show({
                type: 'hits',
                msg: d.Message,
                onAfterHide: function() {
                    top.location.href = "/login.html";
                },
                timeout: 1000
            });

        else {
            top.$.messager.alert('系统提示', d.Message, 'warning');
        }
    }
}