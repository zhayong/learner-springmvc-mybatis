<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
 content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-title" content="english bady" />
<meta name="application-name" content="english bady" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="robots" content="noindex,nofollow">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="resources/js/bootstrap.min.css" />
<!-- Latest Sortable -->
<script src="resources/js/Sortable.js"></script>

<style type="text/css">
body {
 padding: 20px;
}

ul {
 list-style: none;
 padding: 0;
}

.groupClass {
 position: relative;
 display: block;
 float: left;
 width: 100%;
 padding: 10px 15px;
 font-size: 18px;
 margin-bottom: -1px;
 background-color: #fff;
 border: 1px solid #e5e5e5;
 cursor: move;
 cursor: -webkit-grabbing;
}

.groupClass span {
 position: relative;
 display: block;
 float: left;
 text-align: center;
 width: 33.33%;
 padding: 7px 15px;
 margin-bottom: -1px;
 background-color: #fff;
 cursor: move;
 cursor: -webkit-grabbing;
}

.sortable-ghost {
 opacity: .9;
 background: #DCE6F2;
}
</style>
</head>

<body>
 <!--  <div class="groupClass" style="background-color: #e5e5e5;">
  <span>studentName</span><span>studentClass</span><span>studentNo.</span>
 </div> -->
 <ul id="items">
  <c:forEach var="emp" items="${list}">
   <li class="groupClass">
    <span>${emp.name}</span>
    <span>${emp.designation}</span>
    <span>${emp.id}</span>
   </li>
  </c:forEach>
 </ul>

<div style="width:100%;overflow:hidden;">
 <button style="position:relative;margin-top: 30px; height: 50px; line-height: 50px;  width: 200px; font-size: 18px; 
 background-color: #376092; color: white; left: 50%; margin-left: -100px;"
  onclick="aaa();">並び替え確定</button></div>

 <script type="text/javascript">
        var el = document.getElementById('items');
        var sortable = new Sortable(el, {
            animation : 200,
            group : {
                name : "shared",
                pull : "clone",
                revertClone : true,
            },
            sort : true,/* 
            onAdd : function(evt) {
                var el = evt.item;
                el.parentNode.removeChild(el);
                alert('Dropped: ' + el.textContent);
            },
            onSort : function(evt) {
                alert(11);
            },
            onAdd : function(evt) { //拖拽时候添加有新的节点的时候发生该事件
                console.log('onAdd.foo:', [ evt.item, evt.from ]);
            },
            onUpdate : function(evt) { //拖拽更新节点位置发生该事件
                console.log('onUpdate.foo:', [ evt.item, evt.from ]);
            },
            onRemove : function(evt) { //删除拖拽节点的时候促发该事件
                console.log('onRemove.foo:', [ evt.item, evt.from ]);
            },
            onStart : function(evt) { //开始拖拽出发该函数
                console.log('onStart.foo:', [ evt.item, evt.from ]);
            },
            onSort : function(evt) { //发生排序发生该事件
                console.log('onSort.foo:', [ evt.item, evt.from ]);
            },
            onEnd : function(evt) { //拖拽完毕之后发生该事件
                console.log('onEnd.foo:', [ evt.item, evt.from ]);
            } */
        });

        function aaa() {
            /* var el = document.getElementById('items');
            var sortable = new Sortable(el, {
                sort : true
            }); */
        }
    </script>
</body>
</html>