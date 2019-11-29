
/*
第一步：为这个插件定义私有作用域。外部的代码不能直接访问插件内部的代码。插件内部的代码不污染全局变量。在一定的作用上解耦了插件与运行环境的依赖。
*/
(function($) {

    //step06-a 在插件里定义方法

    function guidDialogId() {
        var s4 = function() {
            return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
        };
        return "XiuCai-" + (s4() + s4() + "-" + s4() + "-" + s4() + "-" + s4() + "-" + s4() + s4() + s4());
    }

    //step02 插件的扩展方法名称
    $.hDialog = function(options) {
        //step03-b 合并用户自定义属性，默认属性
        options = $.extend({}, $.hDialog.defaults, options || {});

        var dialogId = guidDialogId();
        if (options.id)
            dialogId = options.id;

        var defaultBtn = [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: options.submit
            }, {
                text: '关闭',
                iconCls: 'icon-cancel',
                handler: function() {
                    $("#" + dialogId).dialog("close");
                }
            }];

        if (!options.showBtns)
            defaultBtn = [];

        if (options.buttons.length == 0)
            options.buttons = defaultBtn;

        if (options.max) {
            //dialog.dialog('maximize');
            var winWidth = $(window).width();
            var winHeight = $(window).height();
            options.width = winWidth - 20;
            options.height = winHeight - 20;
        }


        var $dialog = $('<div/>').css('padding', options.boxPadding).appendTo($('body'));

        var dialog = $dialog.dialog($.extend(options, {
            onClose: function() {
                dialog.dialog('destroy');
            }
        })).attr('id', dialogId);
        //.dialog('refresh').dialog('open')

        $dialog.find('.dialog-button').css('text-align', options.align);

        return dialog;
    };

    //step03-a 插件的默认值属性
    $.hDialog.defaults = $.extend({}, $.fn.dialog.defaults, {
        boxPadding: '3px',
        align: 'right', //按钮对齐方式
        href: '',
        id: '',
        content: '',
        height: 200,
        width: 400,
        collapsible: false,
        minimizable: false,
        maximizable: false,
        closable: true,
        modal: true,
        shadow: false,
        mask: true,
        cache: false,
        closed: false,//默认是否关闭窗口 如果为true,需调用open方法打开
        showBtns: true,
        buttons: [],
        submit: function() {
            alert('写入可执行代码');
            return false;
        },
        onBeforeClose: function() {
            $(this).find(".combo-f").each(function() {
                var panel = $(this).data().combo.panel;
                panel.panel("destroy");
            });
            $(this).empty();
        },
        onMove: function(left, right) {
            $('.validatebox-tip').remove();
        }        
    });

    ///////////////////////////////////////////////////////////////////////////////////////////////

    $.hWindow = function(options) {
        var windowId = guidDialogId();

        options = $.extend({}, $.hDialog.defaults, options || {});
        if (!options.href && !options.content) {
            alert('缺少必要的参数 href or content');
            return false;
        }

        var $dialog = $('<div/>').attr('id', windowId).appendTo($('body'));

        if (options.max) {
            //dialog.dialog('maximize');
            var winWidth = $(window).width();
            var winHeight = $(window).height();
            options.width = winWidth - 20;
            options.height = winHeight - 20;
        }

        var win = $dialog.window($.extend(options, {
            onClose: function() {
                win.window('destroy');
            }
        })).window('refresh').attr('id', windowId);


        return win;
    };

    $.hWindow.defaults = $.extend({}, $.fn.window.defaults, {
        href: '',
        content: '',
        height: 300,
        width: 400,
        collapsible: false, 	//折叠
        closable: true,         //显示右上角关闭按钮
        minimizable: false, 	//最小化
        maximizable: false, 	//最大化
        resizable: false, 	    //是否允许改变窗口大小
        title: '窗口标题', 	    //窗口标题
        modal: true, 		    //模态	
        draggable: true,        //允许拖动
        max: false,
        onBeforeClose: function() {
            $(this).find(".combo-f").each(function() {
                var panel = $(this).data().combo.panel;
                alert(panel.html());
                panel.panel("destroy");
            });
            $(this).empty();
        }
    });


    ///////////////////////////////////////////////////////////////////////////////////////////////

    /**
     * JQuery扩展方法，用户对JQuery EasyUI的DataGrid控件进行操作。 
     * datagrid宽度高度自动调整的函数
     */
    $.fn.extend({
        /**
         * 修改DataGrid对象的默认大小，以适应页面宽度。
         * 
         * @param heightMargin
         *            高度对页内边距的距离。
         * @param widthMargin
         *            宽度对页内边距的距离。
         * @param minHeight
         *            最小高度。
         * @param minWidth
         *            最小宽度。
         * 
         */
        resizeDataGrid: function(heightMargin, widthMargin, minHeight, minWidth) {
            var height = $(document.body).height() - heightMargin;
            var width = $(document.body).width() - widthMargin;

            height = height < minHeight ? minHeight : height;
            width = width < minWidth ? minWidth : width;

            $(this).datagrid('resize', {
                height: height,
                width: width
            });
        }
    });

    
    //扩展datagrid 方法 getSelectedIndex
    $.extend($.fn.datagrid.methods, {
        getSelectedIndex: function(jq) {
            var row = $(jq).datagrid('getSelected');
            if (row)
                return $(jq).datagrid('getRowIndex', row);
            else
                return -1;
        },
        checkRows: function(jq, idValues) {
            if (idValues && idValues.length > 0) {
                var rows = $(jq).datagrid('getRows');
                var keyFild = $(jq).datagrid('options').idField;
                $.each(rows, function(i, n) {
                    if ($.inArray(n[keyFild], idValues)) {
                        $(jq).datagrid('checkRow', row);
                    }
                });
            }
            return jq;
        }
    });
    //扩展 combobox 方法 selectedIndex
    $.extend($.fn.combobox.methods, {
        selectedIndex: function(jq, index) {
            if (!index)
                index = 0;
            var data = $(jq).combobox('options').data;
            var vf = $(jq).combobox('options').valueField;
            $(jq).combobox('setValue', eval('data[index].' + vf));
        }
    });

    //释放IFRAME内存
    $.fn.panel.defaults = $.extend({}, $.fn.panel.defaults, {
        onBeforeDestroy: function() {
            var frame = $('iframe', this);
            if (frame.length > 0) {
                frame[0].contentWindow.document.write('');
                frame[0].contentWindow.close();
                frame.remove();
                if ($.browser.msie) {
                    CollectGarbage();
                }
            }
        }
    });

    //tree 方法扩展 全选、取消全选
    $.extend($.fn.tree.methods, {
        checkedAll: function(jq, target) {
            var data = $(jq).tree('getChildren');
            if (target)
                data = $(jq).tree('getChildren', target);

            $.each(data, function(i, n) {
                $(jq).tree('check', n.target);
            });
        }
    });

    $.extend($.fn.tree.methods, {
        uncheckedAll: function(jq) {
            var data = $(jq).tree('getChildren');
            $.each(data, function(i, n) {
                $(jq).tree('uncheck', n.target);
            });
        }
    });

    /*
    Easyui Datagrid rownumbers行号四位、五位显示不完全的解决办法
    */
    $.extend($.fn.datagrid.methods, {
        fixRownumber: function(jq) {
            return jq.each(function() {
                var panel = $(this).datagrid("getPanel");
                //获取最后一行的number容器,并拷贝一份
                var clone = $(".datagrid-cell-rownumber", panel).last().clone();
                //由于在某些浏览器里面,是不支持获取隐藏元素的宽度,所以取巧一下
                clone.css({
                    "position": "absolute",
                    left: -1000
                }).appendTo("body");
                var width = clone.width("auto").width();
                //默认宽度是25,所以只有大于25的时候才进行fix
                if (width > 25) {
                    //多加5个像素,保持一点边距
                    $(".datagrid-header-rownumber,.datagrid-cell-rownumber", panel).width(width + 5);
                    //修改了宽度之后,需要对容器进行重新计算,所以调用resize
                    $(this).datagrid("resize");
                    //一些清理工作
                    clone.remove();
                    clone = null;
                } else {
                    //还原成默认状态
                    $(".datagrid-header-rownumber,.datagrid-cell-rownumber", panel).removeAttr("style");
                }
            });
        }
    });
    



    /**
     * 1）扩展jquery easyui tree的节点检索方法。使用方法如下：
     * $("#treeId").tree("search", searchText);	 
     * 其中，treeId为easyui tree的根UL元素的ID，searchText为检索的文本。
     * 如果searchText为空或""，将恢复展示所有节点为正常状态
     */

    $.extend($.fn.tree.methods, {
        /**
		 * 扩展easyui tree的搜索方法
		 * @param tree easyui tree的根DOM节点(UL节点)的jQuery对象
		 * @param searchText 检索的文本
		 * @param this-context easyui tree的tree对象
		 */
        search: function(jqTree, searchText) {
            //easyui tree的tree对象。可以通过tree.methodName(jqTree)方式调用easyui tree的方法
            var tree = this;

            //获取所有的树节点
            var nodeList = getAllNodes(jqTree, tree);

            //如果没有搜索条件，则展示所有树节点
            searchText = $.trim(searchText);
            if (searchText == "") {
                for (var i = 0; i < nodeList.length; i++) {
                    $(".tree-node-targeted", nodeList[i].target).removeClass("tree-node-targeted");
                    $(nodeList[i].target).show();
                }
                //展开已选择的节点（如果之前选择了）
                var selectedNode = tree.getSelected(jqTree);
                if (selectedNode) {
                    tree.expandTo(jqTree, selectedNode.target);
                }
                return;
            }

            //搜索匹配的节点并高亮显示
            var matchedNodeList = [];
            if (nodeList && nodeList.length > 0) {
                var node = null;
                for (var i = 0; i < nodeList.length; i++) {
                    node = nodeList[i];
                    if (isMatch(searchText, node.text)) {
                        matchedNodeList.push(node);
                    }
                }

                //隐藏所有节点
                //for (var i = 0; i < nodeList.length; i++) {
                //    $(".tree-node-targeted", nodeList[i].target).removeClass("tree-node-targeted");
                //    $(nodeList[i].target).hide();
                //}

                //折叠所有节点
                tree.collapseAll(jqTree);

                //展示所有匹配的节点以及父节点  			
                for (var i = 0; i < matchedNodeList.length; i++) {
                    showMatchedNode(jqTree, tree, matchedNodeList[i]);
                }
            }
        },

        /**
		 * 展示节点的子节点（子节点有可能在搜索的过程中被隐藏了）
		 * @param node easyui tree节点
		 */
        showChildren: function(jqTree, node) {
            //easyui tree的tree对象。可以通过tree.methodName(jqTree)方式调用easyui tree的方法
            var tree = this;

            //展示子节点
            if (!tree.isLeaf(jqTree, node.target)) {
                var children = tree.getChildren(jqTree, node.target);
                if (children && children.length > 0) {
                    for (var i = 0; i < children.length; i++) {
                        if ($(children[i].target).is(":hidden")) {
                            $(children[i].target).show();
                        }
                    }
                }
            }
        },

        /**
		 * 将滚动条滚动到指定的节点位置，使该节点可见（如果有滚动条才滚动，没有滚动条就不滚动）
		 * @param param {
		 * 	  treeContainer: easyui tree的容器（即存在滚动条的树容器）。如果为null，则取easyui tree的根UL节点的父节点。
		 *    targetNode:  将要滚动到的easyui tree节点。如果targetNode为空，则默认滚动到当前已选中的节点，如果没有选中的节点，则不滚动
		 * } 
		 */
        scrollTo: function(jqTree, param) {
            //easyui tree的tree对象。可以通过tree.methodName(jqTree)方式调用easyui tree的方法
            var tree = this;

            //如果node为空，则获取当前选中的node
            var targetNode = param && param.targetNode ? param.targetNode : tree.getSelected(jqTree);

            if (targetNode != null) {
                //判断节点是否在可视区域				
                var root = tree.getRoot(jqTree);
                var $targetNode = $(targetNode.target);
                var container = param && param.treeContainer ? param.treeContainer : jqTree.parent();
                var containerH = container.height();
                var nodeOffsetHeight = $targetNode.offset().top - container.offset().top;
                if (nodeOffsetHeight > (containerH - 30)) {
                    var scrollHeight = container.scrollTop() + nodeOffsetHeight - containerH + 30;
                    container.scrollTop(scrollHeight);
                }
            }
        }
    });


    /**
	 * 展示搜索匹配的节点
	 */

    function showMatchedNode(jqTree, tree, node) {
        //展示所有父节点
        $(node.target).show();
        $(".tree-title", node.target).addClass("tree-node-targeted");
        var pNode = node;
        while ((pNode = tree.getParent(jqTree, pNode.target))) {
            $(pNode.target).show();
        }
        //展开到该节点
        tree.expandTo(jqTree, node.target);
        //如果是非叶子节点，需折叠该节点的所有子节点
        if (!tree.isLeaf(jqTree, node.target)) {
            tree.collapse(jqTree, node.target);
        }
    }

    /**
	 * 判断searchText是否与targetText匹配
	 * @param searchText 检索的文本
	 * @param targetText 目标文本
	 * @return true-检索的文本与目标文本匹配；否则为false.
	 */

    function isMatch(searchText, targetText) {
        return $.trim(targetText) != "" && targetText.indexOf(searchText) != -1;
    }

    /**
	 * 获取easyui tree的所有node节点
	 */

    function getAllNodes(jqTree, tree) {
        var allNodeList = jqTree.data("allNodeList");
        if (!allNodeList) {
            var roots = tree.getRoots(jqTree);
            allNodeList = getChildNodeList(jqTree, tree, roots);
            jqTree.data("allNodeList", allNodeList);
        }
        return allNodeList;
    }

    /**
	 * 定义获取easyui tree的子节点的递归算法
	 */

    function getChildNodeList(jqTree, tree, nodes) {
        var childNodeList = [];
        if (nodes && nodes.length > 0) {
            var node = null;
            for (var i = 0; i < nodes.length; i++) {
                node = nodes[i];
                childNodeList.push(node);
                if (!tree.isLeaf(jqTree, node.target)) {
                    var children = tree.getChildren(jqTree, node.target);
                    childNodeList = childNodeList.concat(getChildNodeList(jqTree, tree, children));
                }
            }
        }
        return childNodeList;
    }


})(jQuery)