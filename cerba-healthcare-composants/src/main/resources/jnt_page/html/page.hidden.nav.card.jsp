<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>


<c:set var="_title_" value="${currentNode.displayableName}"/>
<c:set var="title" value="${not empty _title_ ? fn:escapeXml(_title_) : ''}"/>

<c:set var="_abstract_" value="${currentNode.properties['cerba:abstract'].string}"/>
<%--<c:set var="abstract" value="${not empty _abstract_ ? fn:substring(functions:removeHtmlTags(_abstract_),0,120) : ''}"/>--%>
<c:set var="abstract" value="${not empty _abstract_ ? fn:escapeXml(_abstract_) : ''}"/>

<c:url var="url" value="${currentNode.url}" context="/"/>

<%--img--%>
<c:set var="coverNode" value="${currentNode.properties['cerba:cover'].node}"/>

<%--<template:addCacheDependency node="${coverNode}" />--%>
<%--<c:if test="${not empty coverNode}">--%>
<%--    <c:set var="_alt_" value="${coverNode.displayableName}"/>--%>
<%--    <c:set var="alt" value="${not empty _alt_ ? fn:escapeXml(_alt_) : ''}"/>--%>
<%--    <c:url var="imgUrl" value="${coverNode.url}" context="/" />--%>
<%--</c:if>--%>

<div class="card">
    <template:module view="hidden.cerba.img" node="${coverNode}" editable="false">
        <template:param name="class" value="card-img-top"/>
    </template:module>
<%--    <c:if test="${not empty imgUrl}">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${jcr:isNodeType(renderContext.site, 'cldin:configuration')}">--%>

<%--                <c:set var="gravity" value="auto"/>--%>
<%--                <c:set var="crop" value="fill"/>--%>
<%--                <c:set var="raw" value=""/>--%>

<%--                <img src="<cl:url node='${coverNode}' width="768" gravity="${gravity}" crop="${crop}" raw="${raw}"/>"--%>
<%--                     srcset="<cl:url node="${coverNode}" width="256" crop="${crop}" gravity="${gravity}" raw="${raw}"/> 256w,--%>
<%--                            <cl:url node="${coverNode}" width="512" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 512w,--%>
<%--                            <cl:url node="${coverNode}" width="768" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 768w,--%>
<%--                            <cl:url node="${coverNode}" width="1024" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 1024w,--%>
<%--                            <cl:url node="${coverNode}" width="1280" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 1280w,--%>
<%--                            <cl:url node="${coverNode}" width="1600" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 1600w,--%>
<%--                            <cl:url node="${coverNode}" width="2000" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 2000w"--%>
<%--                     class="card-img-top"--%>
<%--                     alt="${alt}"--%>
<%--                />--%>

<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <img class="card-img-top" src="${imgUrl}" alt="${alt}">--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--    </c:if>--%>

    <div class="card-body text-center">
        <h3 class="card-title">${title}</h3>
        <p class="card-text">${abstract}</p>
        <a href="${url}" class="lead text-primary">
            <fmt:message key="read_more" />
            <i class="fa fa-chevron-right" aria-hidden="true"></i>
        </a>
    </div>
</div>