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

<template:addResources type="css" resources="banner.css"/>

<c:set var="title" value="${fn:escapeXml(currentNode.displayableName)}"/>
<c:set var="abstract" value="${fn:escapeXml(currentNode.properties['cerba:abstract'].string)}"/>
<c:set var="mask" value="${currentNode.properties['cerba:mask'].string}"/>
<c:set var="imgNode" value="${currentNode.properties['cerba:bgImg'].node}"/>

<c:set var="imageView" value="hidden.cerba.img"/>
<c:if test="${not empty mask}">
    <c:set var="imageView" value="hidden.cerba.${mask}"/>
</c:if>

<div class="banner">
    <template:module view="${imageView}" node="${imgNode}" editable="false"/>
    <div class="content text text-white">
        <h1 class="title">${title}</h1>
        <span>
            <p class="mb-5">${abstract}</p>
        </span>
    </div>
</div>
