<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%--<c:set var="imgNode" value="${currentNode.properties.image.node}"/>--%>
<%--<c:if test="${not empty imgNode}">--%>

    <c:set var="class" value="${fn:escapeXml(currentResource.moduleParams.class)}"/>
    <c:set var="id" value="${currentResource.moduleParams.id ? currentResource.moduleParams.id : currentNode.identifier}"/>
    <%-- cloudinary config params --%>
    <c:set var="gravity" value="${currentResource.moduleParams.gravity ? currentResource.moduleParams.gravity : 'auto'}"/>
    <c:set var="crop" value="${currentResource.moduleParams.crop ? currentResource.moduleParams.crop : 'fill'}"/>
    <c:set var="raw" value="${currentResource.moduleParams.raw ? currentResource.moduleParams.raw : ''}"/>
    <c:set var="widths" value="${currentResource.moduleParams.widths ? currentResource.moduleParams.widths :
        '256,512,768,1024,1280,1600,2000'}"/>
    <c:set var="defaultWidth" value="${currentResource.moduleParams.defaultWidth ? currentResource.moduleParams.defaultWidth :'768'}"/>

    <c:set var="alt" value="${fn:escapeXml(currentNode.displayableName)}"/>
    <c:url var="imgUrl" value="${currentNode.url}" context="/" />

    <c:choose>
        <c:when test="${jcr:isNodeType(renderContext.site, 'cldin:configuration')}">

<%--            <c:set var="gravity" value="auto"/>--%>
<%--            <c:set var="crop" value="fill"/>--%>
<%--            <c:set var="raw" value=""/>--%>

            <img src="<cl:url node='${currentNode}' width="${defaultWidth}" gravity="${gravity}" crop="${crop}" raw="${raw}"/>"
                 srcset="<c:forEach items="${fn:split(widths, ',')}" var="width" varStatus="status">
                            <c:if test="${!status.first}">,</c:if>
                            <cl:url node="${currentNode}" width="${width}" crop="${crop}" gravity="${gravity}" raw="${raw}"/> ${width}w
                        </c:forEach>
<%--                            <cl:url node="${currentNode}" width="512" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 512w,--%>
<%--                            <cl:url node="${currentNode}" width="768" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 768w,--%>
<%--                            <cl:url node="${currentNode}" width="1024" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 1024w,--%>
<%--                            <cl:url node="${currentNode}" width="1280" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 1280w,--%>
<%--                            <cl:url node="${currentNode}" width="1600" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 1600w,--%>
<%--                            <cl:url node="${currentNode}" width="2000" gravity="${gravity}" crop="${crop}" raw="${raw}"/> 2000w--%>
                        "
                 class="${class}"
                 alt="${alt}"
            />

        </c:when>
        <c:otherwise>
            <img class="${class}" src="${imgUrl}" alt="${alt}">
        </c:otherwise>
    </c:choose>
<%--</c:if>--%>

