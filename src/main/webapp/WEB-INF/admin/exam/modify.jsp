﻿<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/_common.jspf" %>
<!DOCTYPE HTML>
<html>
	<head>
		<jsp:include page="../common/_meta.jspf" />
	</head>
	<body>
		<article class="page-container">
			<form class="form form-horizontal" id="form-modify">
				<input class="input-text" type="hidden" name="examId" value="${entity.examId}">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>考试名称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" name="name" value="${entity.name}" maxlength="100">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>考试时间：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" name="examTime" value="<fmt:formatDate value="${entity.examTime}" pattern="yyyy-MM-dd"/>" class="input-text Wdate" 
						style="width:160px;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd', startDate:'%y-%M-%d'})">
					</div>
				</div>
				
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
					</div>
				</div>
			</form>
		</article>
	
		<jsp:include page="../common/_footer.jspf" />
		
		<script type="text/javascript">
			$(function() {
				$("#form-modify").validate({
					rules : {
						name : {
							required : true,
							minlength : 2,
							maxlength : 20
						}
					},
					onkeyup : false,
					focusCleanup : false,
					success : "valid",
					submitHandler : function(form) {
						$(form).ajaxSubmit({
							type : 'post',
							dataType : "json",
							url : "modify.html" ,
							success : function(data) {
								if (data.status == 200) {
									layer.msg(data.msg, {icon:1, time:1000}, next);
		                        } else {
		                        	layer.msg(data.msg, {icon:2, time:2000});
			                    }
							},
			                error: function(data) {
								layer.msg('error!', {icon:2, time:2000});
							}
						});
						function next() {
							var index = parent.layer.getFrameIndex(window.name);
							parent.location.reload();
							parent.layer.close(index);
						}
					}
				});
			});
		</script> 
	</body>
</html>