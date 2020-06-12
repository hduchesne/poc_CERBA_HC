<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:set var="title" value="${fn:escapeXml(currentNode.displayableName)}"/>
<%--<c:set var="title" value="${not empty _title_ ? fn:escapeXml(_title_) : ''}"/>--%>

<c:set var="abstract" value="${fn:escapeXml(currentNode.properties['cerba:abstract'].string)}"/>

<%--img--%>
<c:set var="imgNode" value="${currentNode.properties['cerba:bgImg'].node}"/>
<template:addCacheDependency node="${imgNode}" />
<c:if test="${not empty imgNode}">
    <c:set var="imgAlt" value="${fn:escapeXml(imgNode.displayableName)}"/>
<%--    <c:set var="alt" value="${not empty _alt_ ? fn:escapeXml(_alt_) : ''}"/>--%>
    <c:url var="imgUrl" value="${imgNode.url}" context="/" />
</c:if>

<c:set var="maskNode" value="${currentNode.properties['cerba:maskImg'].node}"/>
<template:addCacheDependency node="${maskNode}" />
<c:if test="${not empty maskNode}">
    <c:set var="maskAlt" value="${fn:escapeXml(maskNode.displayableName)}"/>
<%--    <c:set var="alt" value="${not empty _alt_ ? fn:escapeXml(_alt_) : ''}"/>--%>
    <c:url var="maskUrl" value="${maskNode.url}" context="/" />
</c:if>
<utility:logger level="INFO" value="${maskUrl}"/>

<div class="slider-item" style="background-image: url(${imgUrl});">
<%--    <svg><use xlink:href="=${maskAlt}"></use></svg>--%>
    <img src="${maskUrl}"/>
    <div class="container">
        <div class="row slider-text align-items-center justify-content-center">
            <div class="col-md-8 text-center col-sm-12 element-animate pt-5">
                <h1 class="pt-5"><span>${title}</span></h1>
                <p class="mb-5 w-75">${abstract}</p>
            </div>
        </div>
    </div>
</div>
