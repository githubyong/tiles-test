<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><tiles:getAsString name="title" ignore="true"/></title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.5/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.5/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/menu.css">


    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.5/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/js/common.js"></script>
    <style type="text/css">
        #northPanel {
            background: #53C7A0;
            height: 60px;
            vertical-align: middle;
        }


    </style>
</head>
<body>
<div id="mainLayout" class="easyui-layout hidden" data-options="fit: true">
    <div id="northPanel" data-options="region: 'north', border: false" style="height: 60px; overflow: hidden;">
            <tiles:insertAttribute name="header"/>
    </div>

    <div data-options="region: 'west', split: true, minWidth: 200, maxWidth: 400"
         class="main-sidebar">
        <div class="easyui-accordion side-left" data-options="multiple:true, border: false">
            <tiles:insertAttribute name="menu"/>
        </div>
    </div>

    <div data-options="region: 'center'">
        <tiles:insertAttribute name="body"/>
    </div>
    <div data-options="region: 'south', collapsed: false, border: false"
         style="height: 40px;" class="main-footer">
        <div style="color: #4e5766; padding: 6px 0px 0px 0px; margin: 0px auto; text-align: center; font-size:12px; font-family:微软雅黑;">
            Copyright © yong
        </div>
    </div>

</div>

</body>
</html>