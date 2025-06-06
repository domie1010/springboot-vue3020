<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%
   String path = request.getContextPath();
   String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
   /*
   @Author:Jaylan Zhou
   @Date:
   @projectName:
   @TEL:13166803607
   @QQ:764540631
   */
    
    /*
        全路径,形式如下:
        request.getScheme():获取http协议
        request.getServerName():获取本地服务器名
        request.getServerPort():获取服务器端口号
        path:访问路径
    */

%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basepath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href=" css/css/background/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="css/css/background/css/select.css" rel="stylesheet"
	type="text/css" />
<link href="js/js/background/js/laydate/need/laydate.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="js/js/background/js/laydate/laydate.js"></script>
<script type="text/javascript" src="js/js/background/js/jquery.js"></script>
<script type="text/javascript"
	src="js/js/background/js/jquery.idTabs.min.js"></script>
<script type="text/javascript"
	src="js/js/background/js/select-ui.min.js"></script>
<script type="text/javascript"
	src="js/js/background/editor/kindeditor.js"></script>

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>

<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>

<body>


	<div class="formbody">


		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">发布信息</a></li>
				</ul>
			</div>

			<div id="tab1" class="tabson">

				<div class="formtext">
					Hi，<b>${sessionScope['User']['userName']}</b>，欢迎您使用信息编辑功能！
				</div>

				<!-- form表单 -->

				<form action="user/userUpdate" method="POST"
					onsubmit="return checkSubmit();">
					<input type="hidden" name="id" value="${user['id'] }">
					<ul class="forminfo">
						<li><label>登录名<b>*</b></label><input id="loginName"
							name="loginName" type="text" class="dfinput" placeholder="请填写登录名"  value="${user['loginName'] }"
							style="width: 518px;" /></li>
						<li><label>用户姓名<b>*</b></label><input id="userName"
							name="userName" type="text" class="dfinput" placeholder="请填写用户姓名" value="${user['userName'] }"
							style="width: 518px;" /></li>
						<li><label>年龄<b>*</b></label><input id="age" name="age" value="${user['age'] }"
							type="text" class="dfinput" placeholder="请填写年龄"
							style="width: 518px;" /></li>
						<li><label>用户性别<b>*</b></label><div class="vocation">
							<select class="select3" name="selfId">
								<c:if test="${user['phoneNo'] eq 1}" var="s1">
									<option value="1" selected="selected">男</option>
								</c:if>
								<c:if test="${!s1}">
									<option value="1">男</option>
								</c:if>
								<c:if test="${user['phoneNo'] eq 2}" var="s2">
									<option value="2" selected="selected">女</option>
								</c:if>
								<c:if test="${!s2}">
									<option value="2">女</option>
								</c:if>
							</select>
							</div>
						</li>
						<li><label>电话<b>*</b></label><input id="phone" name="phoneNo" value="${user['phoneNo'] }"
							type="text" class="dfinput" placeholder="请填写电话"
							style="width: 518px;" /></li>
						<li><label>出生日期<b>*</b></label><input id="createDate" name="createDate" value="${user['createDate'] }"
							type="text" class="dfinput" placeholder="请填写出生日期"
							style="width: 518px;" /></li>
						<li><label>职务<b>*</b></label><input id="remark" name="remark" value="${user['remark'] }"
							type="text" class="dfinput" placeholder="请填写职务"
							style="width: 518px;" /></li>
						<li><label>邮箱<b>*</b></label><input id="email" name="email" value="${user['email'] }"
							type="text" class="dfinput" placeholder="请填写邮箱"
							style="width: 518px;" /></li>
						<li><label>地址<b>*</b></label><input id="address" name="address" value="${user['address'] }"
							type="text" class="dfinput" placeholder="请填写地址"
							style="width: 518px;" /></li>
						<li><label>固定电话<b>*</b></label><input id="house_phone" name="house_phone" value="${user['house_phone'] }"
							type="text" class="dfinput" placeholder="请填写固定电话"
							style="width: 518px;" /></li>
						<li><label>学历<b>*</b></label><input id="education" name="education" value="${user['education'] }"
							type="text" class="dfinput" placeholder="请填写学历"
							style="width: 518px;" /></li>
						<li><label>所属部门<b>*</b></label><div class="vocation"> <c:if test="${message!=null }">
								<c:out value="${message }"></c:out>
							</c:if> <select class="select3" name="recommendId" id="recommendId">
								<c:forEach items="${recommend }" var="recommend">
									<c:if test="${user['recommend']['id'] eq recommend['id'] }" var="s2">
										<option value="${recommend['id'] }" selected="selected">${recommend['name'] }</option>
									</c:if>
									<c:if test="${!s2}">
										<option value="${recommend['id'] }">${recommend['name'] }</option>
									</c:if>
								</c:forEach>
						</select></div></li>
						<li><label>角色<b>*</b></label><div class="vocation"> <c:if test="${message!=null }">
								<c:out value="${message }"></c:out>
							</c:if> <select class="select3" name="roleId" id="roleId">
								<c:forEach items="${role }" var="role">
									<c:if test="${user['roleInfo']['id'] eq role['id']}" var="s1">
										<option value="${role['id'] }" selected="selected">${role['title'] }</option>
									</c:if>
									<c:if test="${!s1}">
										<option value="${role['id'] }">${role['title'] }</option>
									</c:if>
								</c:forEach>
						</select></div></li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value="修改信息" /></li>
					</ul>

				</form>
			</div>

		</div>

		<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>

		<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>





	</div>


</body>
<script type="text/javascript"> 
var time = {
		  elem: '#createDate',
		  format: 'YYYY-MM-DD',
		  min: '1900-01-01', //设定最小日期为当前日期
		  max: '2099-06-16', //最大日期
		  istime: true,
		  istoday: false,
		  choose: function(datas){
		     end.min = datas; //开始日选好后，重置结束日的最小日期
		     end.start = datas //将结束日的初始值设定为开始日
		  }
		};
		laydate(time);
    var checkSubmitFlg = false; 
    function checkSubmit() { 
      if (checkSubmitFlg == true) { 
         return false; 
      } 
      var userName = $("#userName").val();
      var loginName = $("#loginName").val();
      var loginPassword = $("#loginPassword").val();
      var phone = $("#phone").val();
      var age = $("#age").val();
      var address = $("#address").val();
      var email = $("#email").val();
      var house_phone = $("#house_phone").val();
      var education = $("#education").val();
      var createDate = $("#createDate").val();
      var remark = $("#remark").val();
		if(!$.trim(userName)){
			alert('请输入用户名!');
			return false;
		}
        if(!$.trim(loginName)){
            alert('请输入登录名!');
            return false;
        }
        if(!$.trim(phone)){
            alert('请输入电话!');
            return false;
        }
        if(!$.trim(remark)){
            alert('请输入职务!');
            return false;
        }
        if(!$.trim(createDate)){
            alert('请输入生日!');
            return false;
        }
        if(!$.trim(age)){
            alert('请输入年龄!');
            return false;
        }
        if(!$.trim(address)){
            alert('请输入地址!');
            return false;
        }
        if(!$.trim(email)){
            alert('请输入邮箱!');
            return false;
        }
        if(!$.trim(house_phone)){
            alert('请输入固定电话!');
            return false;
        }
        if(!$.trim(education)){
            alert('请输入学历!');
            return false;
        }
      checkSubmitFlg = true;
      return true; 
   } 
   document.ondblclick = function docondblclick() { 
    window.event.returnValue = false; 
   } 
   document.onclick = function doconclick() { 
       if (checkSubmitFlg) { 
         window.event.returnValue = false; 
       } 
   } 
</script>
</html>
