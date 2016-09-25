<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<div id="heading" class="console-title console-title-border">
    <div class="pull-left">
        <span>用户查询</span>
    </div>
</div>
<div class="query-div" style="display: inline-block">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <label> 数量&nbsp;</label>
                &nbsp;
                <input type="number" class="text_box1" id="queryStr" name="count" value="30"
                       onkeydown="lisenEnterkey(event,loadgrid)">
            </td>
            <td>
                <input type="button" id="buttonQty" value="查询" class="btn btn-query" onclick="loadgrid()"/>
            </td>
        </tr>
    </table>
</div>

<div id="datatable" class="main-content">
    <table id="dt" width="97%" class="easyui-datagrid"
           rownumbers="true" pagination="true" pagesize="20">
        <thead fitColumns="false">
        <tr>
            <th field="name" width="10%" align="center">name</th>
            <th field="age" width="10%" align="center">age</th>
            <th field="email" width="10%" align="center">email</th>
            <th field="tel" width="20%" align="center">tel</th>
        </tr>
        </thead>
    </table>
</div>

<script type="text/javascript">
    $(function ($) {
        loadgrid();
    });

    function loadgrid() {
        console.log($("#queryStr").val())
        //查询参数直接添加在queryParams中
        $("#dt").datagrid({
            pageNumber: 1,
            pagination: true,
            singleSelect: true,
            method:'get',
            url: "${pageContext.request.contextPath}/test/users",
            queryParams: {
                count: $("#queryStr").val()
            }, onLoadSuccess: function (data) {

                customProcessNew(data);
            }, onLoadError: function () {
                var data = {total: 0, rows: []};
                $(this).datagrid("loadData", data);
            }
        });
    }
</script>