<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="css" resources="style.css" />
<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="javascript" resources="popper.min.js"/>
<template:addResources type="javascript" resources="bootstrap.min.js"/>


<%--&lt;%&ndash; TODO voir la gestion nav en mode edit &ndash;%&gt;--%>
<%--<c:set var="mode" value="${renderContext.mode}"/>--%>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:customBaseNavbar')}">
    <c:set var="ulClass" value="${currentNode.properties.ulClass.string}"/>
    <c:set var="recursive" value="${currentNode.properties.recursive.boolean}"/>
</c:if>
<c:if test="${empty ulClass}">
    <c:set var="ulClass" value="navbar-nav mr-auto"/>
</c:if>
<c:if test="${empty recursive}">
    <c:set var="recursive" value="true"/>
</c:if>
<c:set var="root" value="${currentNode.properties.root.string}"/>
<c:set var="curentPageNode" value="${renderContext.mainResource.node}"/>
<c:if test="${! jcr:isNodeType(curentPageNode,'jmix:navMenuItem')}">
    <c:set var="curentPageNode" value="${jcr:getParentOfType(curentPageNode, 'jmix:navMenuItem')}"/>
</c:if>
<c:choose>
    <c:when test="${root eq 'currentPage'}">
        <c:set var="rootNode" value="${curentPageNode}"/>
    </c:when>
    <c:when test="${root eq 'parentPage'}">
        <c:set var="rootNode" value="${curentPageNode.parent}"/>
    </c:when>
    <c:when test="${root eq 'customRootPage'}">
        <c:set var="rootNode" value="${currentNode.properties.customRootPage.node}"/>
        <c:if test="${empty rootNode}">
            <c:if test="${renderContext.editMode}">
                <div class="alert alert-warning">
                    <strong>Error: </strong> Could not find a valid page for <fmt:message key="bootstrap4mix_customRootPage.customRootPage"/>.
                </div>
            </c:if>
            <c:set var="rootNode" value="${renderContext.site.home}"/>
        </c:if>
    </c:when>
    <c:otherwise>
        <c:set var="rootNode" value="${renderContext.site.home}"/>
    </c:otherwise>
</c:choose>

<c:set var="pagesL1" value="${jcr:getChildrenOfType(rootNode, 'jmix:navMenuItem')}"/>
<c:set var="showPagesL1" value="${fn:length(pagesL1) > 0}"/>
<c:if test="${showPagesL1}">
    <ul class="${ulClass}">
        <c:forEach items="${pagesL1}" var="pageL1" varStatus="status">
            <c:set var="showPageL1" value="true"/>
            <c:if test="${!empty pageL1.properties['j:displayInMenuName']}">
                <c:set var="showPageL1" value="false"/>
                <c:forEach items="${pageL1.properties['j:displayInMenuName']}" var="display">
                    <c:if test="${display.string eq currentNode.name}">
                        <c:set var="showPageL1" value="${display.string eq currentNode.name}"/>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${showPageL1}">
                <c:choose>
                    <c:when test="${jcr:isNodeType(pageL1, 'jnt:navMenuText')}">
                        <c:set var="page1Url" value="#"/>
                        <c:set var="page1Title" value="${pageL1.displayableName}"/>
                    </c:when>
                    <c:when test="${jcr:isNodeType(pageL1, 'jnt:externalLink')}">
                        <c:url var="page1Url" value="${pageL1.properties['j:url'].string}"/>
                        <c:set var="page1Title" value="${pageL1.displayableName}"/>
                    </c:when>
                    <c:when test="${jcr:isNodeType(pageL1, 'jnt:page')}">
                        <c:url var="page1Url" value="${pageL1.url}"/>
                        <c:set var="page1Title" value="${pageL1.displayableName}"/>
                    </c:when>
                    <c:when test="${jcr:isNodeType(pageL1, 'jnt:nodeLink')}">
                        <c:url var="page1Url" value="${pageL1.properties['j:node'].node.url}"/>
                        <c:set var="page1Title" value="${pageL1.properties['jcr:title'].string}"/>
                        <c:if test="${empty page1Title}">
                            <c:set var="page1Title"
                                   value="${pageL1.properties['j:node'].node.displayableName}"/>
                        </c:if>
                    </c:when>
                </c:choose>
                <c:if test="${fn:contains(renderContext.mainResource.path, pageL1.path)}">
                    <c:set var="page1Active" value="true"/>
                </c:if>
                <li class="nav-item">
                    <template:module node="${pageL1}" view="hidden.nav.card" />
                </li>
            </c:if>
            <c:remove var="page1Active"/>
            <c:remove var="page1Url"/>
            <c:remove var="page1Title"/>
        </c:forEach>
    </ul>
</c:if>
