//扩展easyui表单的验证
$.extend($.fn.validatebox.defaults.rules, {
    //移动手机号码验证
    mobile: {//value值为文本框中的值
        validator: function (value) {
            var reg = /^1[3|4|5|8|9]\d{9}$/;
            var rs = reg.test(value);
            return rs;
        },
        message: '输入手机号码格式不正确.'
    },
    username: {
        validator: function (value) {
            var res = true;
            $.ajax({
                async : false,
                type: "GET",
                url: "duplicatename/" + value,
                dataType: "text",  //JQUERY返回的数据格式
                success: function (msg) {
                    res = (msg != 'true');
                }
            });
            return res;
        },
        message: '存在相同的用户名.'
    }
})