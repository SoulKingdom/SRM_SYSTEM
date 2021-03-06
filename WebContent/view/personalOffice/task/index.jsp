﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/common.jsp"></jsp:include>
<style>
.status_style {
	color: #D3D6DA;
}

.status_style strong {
	color: #001930;
}

.at {
	font-weight: bold;
	color: #000000;
}
</style>
</head>

<body class="navbar-top">
	<div class="modal-shiftfix">
		<jsp:include page="/menu.jsp"></jsp:include>
		<div class="container-fluid main-content">
			<div class="panel panel-default">
				<div class="panel-body">
					<strong>视图：</strong> <i class="fa fa-list"></i> <a
						href="${pageContext.request.contextPath}/task.do?method=list">全部</a>
					| <a href="${pageContext.request.contextPath}/task.do?method=list">我的任务</a>
					| <a href="${pageContext.request.contextPath}/task.do?method=list"">我添加的</a>
					&nbsp;&nbsp;&nbsp; <a
						href="${pageContext.request.contextPath}/task.do?method=query&status=0">未启动</a>
					| <a
						href="${pageContext.request.contextPath}/task.do?method=query&status=10">推迟</a>
					| <a
						href="${pageContext.request.contextPath}/task.do?method=query&status=20">进行中</a>
					| <a
						href="${pageContext.request.contextPath}/task.do?method=query&status=30">已完成</a>
				</div>
			</div>

			<div class="widget-container fluid-height clearfix">
				<div class="heading clearfix">
					<i class="icon-table"></i> 任务管理 <a id="add-row"
						class="btn btn-sm btn-primary-outline pull-right"
						href="${pageContext.request.contextPath }/task.do?method=toCreateUl"><i
						class="icon-plus"></i> 新建任务</a>
				</div>

				<div class="widget-content padded clearfix">
					<div id="w0" class="grid-view">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th nowrap>主题</th>
										<th nowrap>关联人</th>
										<th nowrap>负责人</th>
										<th nowrap>结束时间</th>
										<th nowrap>优先级</th>
										<th nowrap>状态</th>
										<th nowrap>创建时间</th>
										<th nowrap>操作人</th>
										<th class="action-column">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${individualTaskVoListSize>0}">
										<c:forEach items="${individualTaskVoList}"
											var="individualTaskVo">
											<tr>
												<td>${ individualTaskVo.topic}</td>
												<td>${individualTaskVo.associates}</td>
												<td>${individualTaskVo.principal}</td>
												<td>${individualTaskVo.endTime}</td>
												<td><c:if test="${individualTaskVo.priority ==30}">
										   高
										</c:if> <c:if test="${individualTaskVo.priority==20}">
										   低
										</c:if>
													<c:if test="${individualTaskVo.priority ==10}">
										  普通
										</c:if></td>
												<td><c:choose>
														<c:when test="${individualTaskVo.status == 0}">
                                                                                                                           未启动
                                                     </c:when>

														<c:when test="${individualTaskVo.status ==10}">
                                                                                                                            推迟
                                                     </c:when>
														<c:when test="${individualTaskVo.status ==20}">
                                                                                                                             进行中
                                                      </c:when>
														<c:when test="${individualTaskVo.status ==30}">
                                                                                                                              已完成
                                                     </c:when>
														<c:otherwise>
                                                                                                                            无法识别
                                                    </c:otherwise>
													</c:choose></td>
												<td>${individualTaskVo.createTime}</td>
												<td>${individualTaskVo.operator}</td>
												<td><a class="label label-success"
													href="${pageContext.request.contextPath }/task.do?method=queryById&taskId=${individualTaskVo.taskId}"
													title="查看" aria-label="查看">查看</a> <a
													class="label label-danger"
													href="${pageContext.request.contextPath }/task.do?method=remove&taskId=${individualTaskVo.taskId}">删除</a>
													<a class="label label-primary"
													href="${pageContext.request.contextPath }/task.do?method=update&taskId=${individualTaskVo.taskId}&status=20">进行</a>
													<a class="label label-primary"
													href="${pageContext.request.contextPath }/task.do?method=update&taskId=${individualTaskVo.taskId}&status=30">完成</a></td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${individualTaskVoListSize<=0}">
										<tbody>
											<tr>
												<td>暂无数据</td>
											</tr>
										</tbody>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
