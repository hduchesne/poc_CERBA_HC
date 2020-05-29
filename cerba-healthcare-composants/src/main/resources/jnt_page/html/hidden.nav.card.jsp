<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>

<template:addResources type="css" resources="style.css" />

<c:set var="title" value="${currentNode.displayableName}"/>
<c:set var="abstract" value="${currentNode.properties['cerba:abstract'].string}"/>
<c:set var="coverNode" value="${currentNode.properties['cerba:cover'].string}"/>

<c:url var="url" value="${currentNode.url}" context="/"/>

<div class="card nav-card">
    <template:module view="hidden.img.card" node="${coverNode}">
        <template:param name="class" value="card-img-top"/>
    </template:module>

    <div class="card-body">
        <h5 class="card-title">${title}</h5>
        <p class="card-text">${abstract}</p>
        <a href="${url}" class="btn btn-primary"><fmt:message key="read_more" /></a>
    </div>
</div>