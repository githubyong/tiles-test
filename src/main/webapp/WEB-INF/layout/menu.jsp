<div id="menucontent" class="easyui-accordion side-left" data-options="multiple:true, border: false">
    <script id="menu" type="text/html">
        {{each list as m}}
        {{if (m.permitted)}}
        <div title="{{m.name}}" data-options="iconCls:'{{m.icon}}'">
            {{each m.children as c}}
            {{if (c.permitted)}}
            <a class="easyui-linkbutton menu-link-btn" data-options="plain:true"
               href="${pageContext.request.contextPath}{{c.url}}">{{c.name}}</a>
            {{/if}}
            {{/each}}
        </div>
        {{/if}}
        {{/each}}
    </script>
</div>

<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/artTemplate-3.0.1/dist/template.js"></script>
<script type="text/javascript">
    <%--var menuData = {list:<%=session.getAttribute("menus") %>};//从登录的session中获取菜单的json--%>
    var menuData = {"list":[
                                {"id":1,"name":"MENU-1","url":"","icon":"icon-1","permitted":true,"children":[
                                    {"id":101,"name":"test1-1","url":"/test/page1","icon":"","permitted":true}]},
                                {"id":2,"name":"MENU-2","url":"","icon":"icon-2","permitted":true,"children":[
                                    {"id":201,"name":"test2-page1","url":"/test/page1","icon":"","permitted":true},
                                    {"id":202,"name":"test2-page2","url":"/test/page2","icon":"","permitted":true},
                                    {"id":203,"name":"test2-page3","url":"/test/page3","icon":"","permitted":true},
                                    {"id":204,"name":"test json","url":"/test/hello","icon":"","permitted":true}]
                                }
                             ]
                    };
    var html = template('menu', menuData);
    document.getElementById("menucontent").innerHTML = html;
    //    console.log(html)
</script>