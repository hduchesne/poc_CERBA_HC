<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>


<c:set var="_title_" value="${currentNode.displayableName}"/>
<c:set var="title" value="${not empty _title_ ? fn:escapeXml(_title_) : ''}"/>

<c:set var="imgNode" value="${currentNode.properties['image'].node}"/>
<template:addCacheDependency node="${imgNode}" />
<c:if test="${not empty imgNode}">
    <c:set var="_alt_" value="${imgNode.displayableName}"/>
    <c:set var="alt" value="${not empty _alt_ ? fn:escapeXml(_alt_) : ''}"/>
    <c:url var="imgUrl" value="${imgNode.url}" context="/" />
</c:if>

<c:url var="url" value="${currentNode.url}" context="/"/>

<!-- category -->
<c:set var="newsCategories" value="${currentNode.properties['j:defaultCategory']}"/>

<c:forEach items="${newsCategories}" var="category" varStatus="status">
    <c:set var="categories" value="${categories} ${category.node.displayableName}"/>
</c:forEach>

<div class="col-md-4 col-sm-6 portfolio-item ${categories}">
    <a href="${url}" class="portfolio-link">
        <div class="portfolio-hover">
            <div class="portfolio-hover-content">
                <i class="faNews fa-search-plus"></i>
            </div>
        </div>
        <c:if test="${not empty imgNode}">
            <c:choose>
                <c:when test="${jcr:isNodeType(renderContext.site, 'cldin:configuration')}">

                    <c:set var="gravity" value="auto"/>
                    <c:set var="crop" value="fill"/>
                    <c:set var="raw" value=""/>

                    <img src="<cl:url node='${imgNode}' width="768" gravity="${gravity}" crop="${crop}" raw="${raw}"/>"
                         srcset="<cl:url node="${imgNode}" width="256" crop="${crop}" gravity="${gravity}" raw="${raw}"/> 256w,
                            <cl:url node="${imgNode}" width="512" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 512w,
                            <cl:url node="${imgNode}" width="768" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 768w,
                            <cl:url node="${imgNode}" width="1024" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 1024w,
                            <cl:url node="${imgNode}" width="1280" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 1280w,
                            <cl:url node="${imgNode}" width="1600" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 1600w,
                            <cl:url node="${imgNode}" width="2000" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 2000w"
                         class="img-fluid w-100"
                         alt="${alt}"
                    />

                </c:when>
                <c:otherwise>
                    <img src="${imgUrl}" class="img-fluid w-100" alt="${alt}">
                </c:otherwise>
            </c:choose>
        </c:if>
    </a>
    <div class="portfolio-caption">
        <h4>${title}</h4>
        <p class="text-muted">
            ${categories}
        </p>
    </div>
</div>