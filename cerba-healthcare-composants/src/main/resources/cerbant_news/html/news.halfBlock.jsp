<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<template:addResources type="css" resources="style.css"/>

<c:set var="title" value="${fn:escapeXml(currentNode.displayableName)}"/>
<c:set var="description" value="${currentNode.properties['desc'].string}"/>
<fmt:setLocale value="${language}" scope="session"/>
<fmt:formatDate var="date" value="${currentNode.properties['date'].time}" type="date"/>

<c:url var="url" value="${currentNode.url}" context="/"/>
<!-- category -->
<c:set var="newsCategories" value="${currentNode.properties['j:defaultCategory']}"/>
<c:set var="numCat" value="${fn:length(newsCategories)}" />

<%--loop in reverse order--%>
<c:forEach var="i" begin="1" end="${numCat}"  varStatus="status">
    <c:choose>
        <c:when test="${status.index == 1}">
            <c:set var="categories" value="${newsCategories[numCat-i].node.displayableName}"/>
        </c:when>
        <c:otherwise>
            <c:set var="categories" value="${categories} & ${newsCategories[numCat-i].node.displayableName}"/>
        </c:otherwise>
    </c:choose>
</c:forEach>

<%--img--%>
<c:set var="imgNode" value="${currentNode.properties['image'].node}"/>

<article class="half d-md-flex d-block">
    <picture>
        <template:module view="hidden.cerba.img" node="${imgNode}" editable="false">
            <template:param name="class" value="image"/>
            <template:param name="widths" value="512,1024"/>
            <template:param name="defaultWidth" value="1024"/>
        </template:module>
    </picture>
    <div class="text">
        <span class="category-wrapper text-primary">
            ${categories}
            <span class="text-secondary">${date}</span>
        </span>
        <h3 class="h4 mt-3">${title}</h3>
        ${description}
        <a href="${url}" class="lead text-primary">
            <fmt:message key="read_more" />
            <i class="fa fa-chevron-right" aria-hidden="true"></i>
        </a>
    </div>
</article>