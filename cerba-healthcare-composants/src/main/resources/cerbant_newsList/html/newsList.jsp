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

<template:addResources type="css" resources="portfolio.css"/>
<template:addResources type="javascript" resources="isotope.pkgd.min.js"/>
<template:addResources type="javascript" resources="filter.js"/>


<%--<c:set var="siteNode" value="${renderContext.site}"/>--%>
<c:set var="title" value="${fn:escapeXml(currentNode.displayableName)}"/>
<%--<c:set var="title" value="${not empty _title_ ? fn:escapeXml(_title_) : ''}"/>--%>
<c:set var="description" value="${currentNode.properties['cerba:desc'].string}"/>
<%--<c:set var="categories2Filter" value="${currentNode.properties['cerba:categoryFilter']}"/>--%>
<%--<c:set var="nodeType" value="${currentNode.properties['cerba:content2List'].string}"/>--%>

<%--<c:set var="max" value="${currentNode.properties['cerba:maxElt'].long}"/>--%>

<%--<c:set var="queryClause" value="ISDESCENDANTNODE(nodes,'${currentNode.resolveSite.path}')" />--%>

<%--<c:forEach items="${categories2Filter}" var="category" varStatus="status" >--%>
<%--    <c:if test="${status.first}">--%>
<%--        <c:set var="queryClause" value="${queryClause} AND ("/>--%>
<%--    </c:if>--%>
<%--    <c:set var="queryClause" value="${queryClause} nodes.[j:defaultCategory] = '${category.string}'" />--%>
<%--    <c:choose>--%>
<%--        <c:when test="${status.last}">--%>
<%--            <c:set var="queryClause" value="${queryClause})" />--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--            <c:set var="queryClause" value="${queryClause} OR " />--%>
<%--        </c:otherwise>--%>
<%--    </c:choose>--%>
<%--</c:forEach>--%>

<%--&lt;%&ndash; get the child items &ndash;%&gt;--%>
<%--<jcr:sql var="nodesList" limit="${max}"--%>
<%--         sql="SELECT * FROM [${nodeType}] AS nodes WHERE ${queryClause} ORDER BY nodes.[j:published] desc" />--%>

<!-- Portfolio Grid Section -->
<section id="portfolio" class="bg-light-gray">
    <div class="gallary animate-grid">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">${title}</h2>
                    <h3 class="section-subheading text-muted">${description}</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 w-100">
                    <div class="categories">
                        <ul>
                            <li>
                                <ol>
                                    <li><a href="#" data-filter="*" class="btn btn-outline-primary active">All</a></li>

                                    <script language="JavaScript">
                                        const categories = [];
                                        <c:forEach items="${moduleMap.currentList}" var="subchild" begin="${moduleMap.begin}" end="${moduleMap.end}">
                                        <template:module node="${subchild}" view="${moduleMap.subNodesView}" editable="${moduleMap.editable && !resourceReadOnly}"/>
                                        <c:set var="isEmpty" value="false"/>
                                        </c:forEach>
                                        <c:forEach items="${nodesList.nodes}" var="node" >
                                        <c:set var="nodeCategories" value="${node.properties['j:defaultCategory']}"/>
                                        <c:forEach items="${nodeCategories}" var="category">
                                        categories.push("${category.node.displayableName}");
                                        </c:forEach>
                                        </c:forEach>

                                        categories.reduce((bundle,category) => {
                                            if(!bundle.includes(category))
                                                bundle.push(category);
                                            return bundle;
                                        },[]).forEach(category =>
                                            document.write('<li><a class="btn btn-primary-outline" href="#" data-filter=".'+category+'">'+category+'</a></li>')
                                        )
                                    </script>

                                </ol>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row gallary-thumbs">
                <c:forEach items="${moduleMap.currentList}" var="subchild" begin="${moduleMap.begin}" end="${moduleMap.end}">
                    <template:module node="${subchild}" view="${moduleMap.subNodesView}" editable="${moduleMap.editable && !resourceReadOnly}"/>
                    <c:set var="isEmpty" value="false"/>
                </c:forEach>
                <c:forEach items="${nodesList.nodes}" var="node" >
                    <template:module view="hidden.categoryList" node="${node}"/>
                </c:forEach>
            </div>
        </div>
    </div>
</section>

<%--<c:if test="${renderContext.editMode}">--%>
<%--    &lt;%&ndash;--%>
<%--    As only one child type is defined no need to restrict--%>
<%--    if a new child type is added restriction has to be done--%>
<%--    using 'nodeTypes' attribute--%>
<%--    &ndash;%&gt;--%>
<%--    <template:module path="*" />--%>
<%--</c:if>--%>