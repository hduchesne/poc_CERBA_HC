<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<c:set var="_title_" value="${currentNode.displayableName}"/>
<c:set var="title" value="${not empty _title_ ? fn:escapeXml(_title_) : ''}"/>

<c:set var="description" value="${currentNode.properties['desc'].string}"/>
<fmt:setLocale value="${language}" scope="session"/>
<fmt:formatDate var="date" value="${currentNode.properties['date'].time}" type="date"/>

<c:url var="url" value="${currentNode.url}" context="/"/>
<%--TODO manage category voir ce que j'utilise cat,tag,interet...--%>

<%--img--%>
<c:set var="imgNode" value="${currentNode.properties['image'].node}"/>
<template:addCacheDependency node="${imgNode}" />
<c:if test="${not empty imgNode}">
    <c:set var="_alt_" value="${imgNode.displayableName}"/>
    <c:set var="alt" value="${not empty _title_ ? fn:escapeXml(_alt_) : ''}"/>
    <c:url var="imgUrl" value="${imgNode.url}" context="/" />
</c:if>


<%--<c:set var="imagePosition" value="${currentNode.properties.imagePosition.string == 'right'?'order-2':'' }"/>--%>

<div class="half d-lg-flex d-block">
    <picture>
        <img src="${imgUrl}" alt="${alt}"/>
<%--        <div class="image-display" style="background-image: url('${imageURL}');"></div>--%>
    </picture>
    <div class="text">
        <span class="category-wrapper">
            Categorie
            <span>${date}</span>
        </span>
        <h3>${title}</h3>
        ${description}
        <a href="${url}" class="btn btn-primary"><fmt:message key="read_more" /></a>
    </div>
</div>