<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<c:set var="title" value="${fn:escapeXml(currentNode.displayableName)}"/>
<c:set var="description" value="${currentNode.properties['desc'].string}"/>
<fmt:setLocale value="${language}" scope="session"/>
<fmt:formatDate var="date" value="${currentNode.properties['date'].time}" type="date"/>

<c:url var="url" value="${currentNode.url}" context="/"/>
<!-- category -->
<c:set var="newsCategories" value="${currentNode.properties['j:defaultCategory']}"/>

<c:forEach items="${newsCategories}" var="category" varStatus="status">
    <c:set var="categories" value="${categories} ${category.node.displayableName}"/>
</c:forEach>

<%--img--%>
<c:set var="imgNode" value="${currentNode.properties['image'].node}"/>

<div class="half d-lg-flex d-block">
    <picture>
        <template:module view="hidden.cerba.img" node="${imgNode}" editable="false">
            <template:param name="widths" value="512,1024"/>
            <template:param name="defaultWidth" value="1024"/>
        </template:module>
    </picture>
    <div class="text">
        <span class="category-wrapper">
            ${categories}
            <span>${date}</span>
        </span>
        <h3>${title}</h3>
        ${description}
        <a href="${url}" class="btn btn-primary"><fmt:message key="read_more" /></a>
    </div>
</div>