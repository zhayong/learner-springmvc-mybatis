<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="icon" href="resources/favicon.ico">
<link rel="apple-touch-icon" href="resources/yarukey_favorite.png" />
<spring:url value="../resources/js" var="publicResourceJsRoot" />
<spring:url value="../resources/img" var="publicResourceImgRoot" />
<spring:url value="../resources/dist" var="dist" />
<spring:url value="../resources/bower_components" var="bower_components" />
<!-- Bootstrap css -->
<link href="${publicResourceJsRoot}/bootstrap/css/bootstrap.min.css"
 rel="stylesheet">
<link
 href="${publicResourceJsRoot}/bootstrap/css/bootstrap-theme.min.css"
 rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet"
 href="${bower_components }/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
 href="${bower_components }/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${dist }/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${dist }/skins/_all-skins.min.css">

<link rel="stylesheet"
 href="${bower_components }/zTree/css/zTreeStyle/zTreeStyle.css"
 type="text/css">

<style type="text/css">
.ztree li span.button.add {
 margin-left: 2px;
 margin-right: -1px;
 background-position: -144px 0;
 vertical-align: top;
 *vertical-align: middle
}
</style>
<title>菜单管理</title>
</head>

<body class="hold-transition skin-blue sidebar-mini">
 <div class="wrapper">

  <!-- Header page -->
  <jsp:include page="../header.jsp"></jsp:include>
  <!-- Header page -->

  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="../menu.jsp"></jsp:include>
  <!-- Left side column. contains the logo and sidebar -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
    <h1>
     操作目录树 <small>信息</small>
    </h1>
    <ol class="breadcrumb">
     <li><a href="#"><i class="fa fa-dashboard"></i>菜单管理</a></li>
     <li><a href="#">菜单信息</a></li>
     <li class="active">操作目录树</li>
    </ol>
   </section>

   <!-- Main content -->
   <section class="content">

    <div class="panel panel-default">
     <div class="panel-heading">目录树操作区域</div>
     <div class="panel-body">
      <div class="row">
       <div class="col-xs-12">
        <div class="box-body"
         style="background-color: #fff; height: auto; min-height: auto;">
         <div class="content_wrap">
          <div class="zTreeDemoBackground left">
           <ul id="treeDemo" class="ztree"></ul>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>

    <div class="panel panel-default">
     <div class="panel-heading">
      <h3 class="panel-title">表格区域</h3>
     </div>
     <div class="panel-body">Panel content</div>
    </div>

   </section>
   <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Footer page -->
  <jsp:include page="../footer.jsp"></jsp:include>
  <!-- Footer page -->

  <!-- Control Sidebar -->
  <jsp:include page="../controlSidebar.jsp"></jsp:include>
  <!-- /.control-sidebar -->

  <!-- Add the sidebar's background. This div must be placed  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
 </div>
 <!-- ./wrapper -->
 <script type="text/javascript"
  src="${publicResourceJsRoot}/jquery.min.js?20170925_01"></script>
 <script type="text/javascript"
  src="${publicResourceJsRoot}/bootstrap/js/bootstrap.min.js"></script>
 <script type="text/javascript"
  src="${bower_components}/zTree/js/jquery.ztree.core.js"></script>
 <script type="text/javascript"
  src="${bower_components}/zTree/js/jquery.ztree.excheck.js"></script>
 <script type="text/javascript"
  src="${bower_components}/zTree/js/jquery.ztree.exedit.js"></script>
 <!-- AdminLTE App -->
 <script src="${ dist}/adminlte.min.js"></script>
 <!-- AdminLTE for demo purposes -->
 <script src="${ dist}/demo.js"></script>
 <script type="text/javascript">
        var setting = {
            view : {
                addHoverDom : addHoverDom,
                removeHoverDom : removeHoverDom,
                selectedMulti : false
            },
            edit : {
                enable : true,
                editNameSelectAll : true,
                showRemoveBtn : showRemoveBtn,
                showRenameBtn : showRenameBtn
            },
            data : {
                simpleData : {
                    enable : true
                }
            },
            callback : {
                beforeDrag : beforeDrag,
                beforeEditName : beforeEditName,
                beforeRemove : beforeRemove,
                beforeRename : beforeRename,
                onRemove : onRemove,
                onRename : onRename
            }
        };

        var log, className = "dark";
        function beforeDrag(treeId, treeNodes) {
            return false;
        }

        function beforeEditName(treeId, treeNode) {
            className = (className === "dark" ? "" : "dark");
            showLog("[ " + getTime()
                    + " beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; "
                    + treeNode.name);
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.selectNode(treeNode);
            setTimeout(function() {
                if (confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？")) {
                    setTimeout(function() {
                        zTree.editName(treeNode);
                    }, 0);
                }
            }, 0);
            return false;
        }

        function beforeRemove(treeId, treeNode) {
            className = (className === "dark" ? "" : "dark");
            showLog("[ " + getTime()
                    + " beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; "
                    + treeNode.name);
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.selectNode(treeNode);
            return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
        }

        function onRemove(e, treeId, treeNode) {
            var params = {
                "id" : treeNode.id
            };
            $.ajax({
                type : "GET",
                url : "/learner-springmvc-mybatis/systemInfo/byIdDeleteTrees",
                dataType : "json",
                data : params,
                contentType : "application/json; charset=UTF-8",
                success : function(data) {
                    if (data) {
                        console.log("delete has success");
                    }
                },
                error : function(XMLHttpRequest, textStatus) {
                    alert("通信ERROR。");
                }
            });
        }

        function beforeRename(treeId, treeNode, newName, isCancel) {
            className = (className === "dark" ? "" : "dark");
            showLog((isCancel ? "<span style='color:red'>" : "") + "[ "
                    + getTime() + " beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; "
                    + treeNode.name + (isCancel ? "</span>" : ""));
            if (newName.length == 0) {
                setTimeout(function() {
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    zTree.cancelEditName();
                    alert("节点名称不能为空.");
                }, 0);
                return false;
            }
            return true;
        }

        function onRename(e, treeId, treeNode, isCancel) {
            var params = {
                "id" : treeNode.id,
                "name" : treeNode.name
            };
            $.ajax({
                type : "GET",
                url : "/learner-springmvc-mybatis/systemInfo/byIdUpdateTrees",
                dataType : "json",
                data : params,
                contentType : "application/json; charset=UTF-8",
                success : function(data) {
                    if (data) {
                        console.log("modify has success");
                    }
                },
                error : function(XMLHttpRequest, textStatus) {
                    alert("通信ERROR。");
                }
            });
        }

        function showRemoveBtn(treeId, treeNode) {
            if(treeNode.pId == null){
              return false;  
            }
            return treeNode;//!treeNode.isFirstNode;
        }

        function showRenameBtn(treeId, treeNode) {
            return treeNode;//!treeNode.isLastNode;
        }

        function showLog(str) {
            if (!log)
                log = $("#log");
            log.append("<li class='"+className+"'>" + str + "</li>");
            if (log.children("li").length > 8) {
                log.get(0).removeChild(log.children("li")[0]);
            }
        }

        function getTime() {
            var now = new Date(), h = now.getHours(), m = now.getMinutes(), s = now
                    .getSeconds(), ms = now.getMilliseconds();
            return (h + ":" + m + ":" + s + " " + ms);
        }

        var newCount = 1;
        function addHoverDom(treeId, treeNode) {
            if(treeNode.pId != null){
              return false;  
            }
            var sObj = $("#" + treeNode.tId + "_span");
            if (treeNode.editNameFlag
                    || $("#addBtn_" + treeNode.tId).length > 0)
                return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                    + "' title='add node' onfocus='this.blur();'></span>";
            sObj.after(addStr);
            var btn = $("#addBtn_" + treeNode.tId);
            if (btn)
                btn.bind("click",function() {
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    zTree.addNodes(treeNode, {
                        id : (100 + newCount),
                        pId : treeNode.id,
                        name : "new node" + (newCount++)
                    });
                    var lastTreeNode = treeNode.children[treeNode.children.length - 1];
                    var params = {
                         "id":lastTreeNode.id,
                         "name":lastTreeNode.name,
                         "pId":lastTreeNode.pId,
                         "open":lastTreeNode.open
                    };
                    $.ajax({
                        type : "GET",
                        url : "/learner-springmvc-mybatis/systemInfo/addTrees",
                        dataType : "json",
                        data : params,
                        contentType : "application/json; charset=UTF-8",
                        success : function(data) {
                            if (data) {
                            }
                        },
                        error : function(XMLHttpRequest, textStatus) {
                            alert("通信ERROR。");
                        }
                    });
                    return false;
                });
        };

        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_" + treeNode.tId).unbind().remove();
        };

        function selectAll() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.setting.edit.editNameSelectAll = $("#selectAll").attr(
                    "checked");
        }

        function getAllTreesNodes() {
            var params = {};
            $.ajax({
                type : "GET",
                url : "/learner-springmvc-mybatis/systemInfo/getAllTreesList",
                dataType : "json",
                data : JSON.stringify(params),
                contentType : "application/json; charset=UTF-8",
                success : function(data) {
                    if (data) {
                        $.fn.zTree.init($("#treeDemo"), setting, data);
                        $("#selectAll").bind("click", selectAll);
                    }
                },
                error : function(XMLHttpRequest, textStatus) {
                    alert("通信ERROR。");
                }
            });
        }

        $(document).ready(function() {
            getAllTreesNodes();
        });
    </script>
</body>
</html>