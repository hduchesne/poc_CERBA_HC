<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>


<c:set var="title" value="${fn:escapeXml(currentNode.displayableName)}"/>
<c:set var="abstract" value="${fn:escapeXml(currentNode.properties['cerba:abstract'].string)}"/>

<c:url var="url" value="${currentNode.url}" context="/"/>
<%--img--%>
<c:set var="coverNode" value="${currentNode.properties['cerba:cover'].node}"/>

<div class="card">
    <template:module view="hidden.cerba.img" node="${coverNode}" editable="false">
        <template:param name="class" value="card-img-top"/>
        <template:param name="widths" value="256,512"/>
        <template:param name="defaultWidth" value="512"/>
    </template:module>

    <div class="card-body text-center">
        <h3 class="card-title">${title}</h3>
        <p class="card-text">${abstract}</p>
        <a href="${url}" class="lead text-primary">
            <fmt:message key="read_more" />
            <i class="fa fa-chevron-right" aria-hidden="true"></i>
        </a>
    </div>
</div>