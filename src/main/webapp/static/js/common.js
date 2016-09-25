/* 字典类的格式化*/
function dictFormater(value, row, index) {
    if (value == null) {
        return null;
    }
    return value.nameZh;
}

function dealEmptyData(id) {
    $('#' + id + '').datagrid({
        onLoadSuccess: function (data) {
            if (data.total == 0) {
                $(".pagination").empty;
                $(".pagination").text("没有数据");
                $(".pagination").css("text-align", "center");
                $(".pagination").css("font-size", "20px");
                $(".pagination").css("height", "30px");
            }
            $(".pagination-page-list").remove();
        }
    });
}
//如果数据为空，做特殊处理
function customProcess(data, id) {
    if (data.total == 0) {
        if (id != null) {
            $(id).find(".pagination").empty;
            $(id).find(".pagination").text("没有数据").css({
                "text-align": "center", "font-size": "20px", "height": "30px"
            });
            $(id).find(".pagination-page-list").remove();
        } else {
            $(".pagination").empty;
            $(".pagination").text("没有数据").css({
                "text-align": "center", "font-size": "20px", "height": "30px"
            });
            $(".pagination-page-list").remove();
        }
    }
}
function customProcessNew(data, id) {
    var tip = "<span >没有符合条件的数据</span>";
    if (data.total == 0) {
        var $pager;
        if (id != null) {
            $pager = $(id).find(".datagrid-pager");
        } else {
            $pager = $(".datagrid-pager");
        }
        $pager.empty();
        $pager.append(tip).removeClass("pagination");
        $pager.css({
            "text-align": "center", "padding-top": "2px", "height": "24px"
        });
    }
}
/**
 *在中间位置显示可自动消失的消息框
 * @param tittle 标题
 * @param msg   内容
 * @param timeout   显示时间(ms)
 */
function showmsgCenter(tittle, msg, timeout) {
    $.messager.show({
        title: tittle,
        msg: msg,
        showType: 'slide',
        timeout: timeout,
        showType: 'fade',
        style: {
            right: '',
            bottom: ''
        }
    });
}


function msg_info(msg) {
    $.messager.show({
        title: "提示",
        msg: msg,
        showType: 'slide',
        timeout: 900,
        showType: 'fade',
        style: {
            right: '',
            bottom: ''
        }
    });
}
/**
 * alert图标为error的提示框
 * @param msg
 */
function alertError(msg) {
    $.messager.alert("错误提示", msg, 'error');
    //alert(msg);
}
Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1, //month
        "d+": this.getDate(), //day
        "H+": this.getHours(), //hour
        "m+": this.getMinutes(), //minute
        "s+": this.getSeconds(), //second
        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter
        "S": this.getMilliseconds() //millisecond
    }
    if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
        (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)if (new RegExp("(" + k + ")").test(format))
        format = format.replace(RegExp.$1,
            RegExp.$1.length == 1 ? o[k] :
                ("00" + o[k]).substr(("" + o[k]).length));
    return format;
}

/**
 * 回车键按下时 调用loadgrid
 * @param e
 */
function lisenEnterkey(e, func) {
    var code;
    if (window.event) {
        code = e.keyCode;
    } else if (e.which) {
        code = e.which;
    }
    // var code=e.which;
    var key = String.fromCharCode(code);
    //alert("按下了" + key + ",keycode：" + code);

    if (code == 13) {
        console.log("load grid ");
        func();
    }
}
/**
 * NEC设备状态格式化
 * @param value
 * @param row
 * @param index
 * @returns {string}
 */
function statusFormatterNEC(value, row, index) {
    var res = '';
    var status = row.necDeviceStatusDict;
    if (status != null) {
        res = status.nameZh;
    }
    return res;
}
/**
 * GRL设备状态格式化
 * @param value
 * @param row
 * @param index
 * @returns {string}
 */
function statusFormatterGRL(value, row, index) {
    var res = '';
    var status = row.grlDeviceStatusDict;
    if (status != null) {
        res = status.nameZh;
    }
    return res;
}

function setCookie(c_name, value, expiredays) {
    var exdate = new Date()
    exdate.setDate(exdate.getDate() + expiredays)
    document.cookie = c_name + "=" + escape(value) +
        ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString())
}

function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=")
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1
            c_end = document.cookie.indexOf(";", c_start)
            if (c_end == -1) c_end = document.cookie.length
            return unescape(document.cookie.substring(c_start, c_end))
        }
    }
    return ""
}