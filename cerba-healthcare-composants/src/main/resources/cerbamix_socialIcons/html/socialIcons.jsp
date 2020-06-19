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

<%-- if social icons were included, get the urls --%>
    <c:set var="facebook" value="${currentNode.properties.facebook.string}"/>
    <c:set var="linkedin" value="${currentNode.properties.linkedIn.string}"/>
    <c:set var="twitter" value="${currentNode.properties.twitter.string}"/>
    <c:set var="googlePlus" value="${currentNode.properties.googlePlus.string}"/>
    <c:set var="pinterest" value="${currentNode.properties.pinterest.string}"/>
    <c:set var="instagram" value="${currentNode.properties.instagram.string}"/>
    <c:set var="youtube" value="${currentNode.properties.youtube.string}"/>
    <c:set var="snapchat" value="${currentNode.properties.snapchat.string}"/>
<!-- Contact Social Icons -->


<!--Facebook-->
    <c:if test="${not empty facebook and facebook != 'https://'}">
		<a href="${facebook}" class="btn-floating btn-lg btn-fb" type="button" role="button"><i class="fa fa-facebook-f"></i></a>
    </c:if>
<!--Twitter-->
    <c:if test="${not empty twitter and twitter != 'https://'}">
		<a href="${twitter}" class="btn-floating btn-lg btn-tw" type="button" role="button"><i class="fa fa-twitter"></i></a>
     </c:if>
<!--Google +-->
    <c:if test="${not empty googlePlus and googlePlus != 'https://'}">
		<a href="${googlePlus}" class="btn-floating btn-lg btn-gplus" type="button" role="button"><i class="fa fa-google-plus-g"></i></a>
    </c:if>
<!--Linkedin-->
    <c:if test="${not empty linkedin and linkedin != 'https://'}">
		<a href="${linkedin}" class="btn-floating btn-lg btn-li" type="button" role="button"><i class="fa fa-linkedin-in"></i></a>
    </c:if>
<!--Instagram-->
    <c:if test="${not empty instagram and instagram != 'https://'}">
		<a href="${instagram}" class="btn-floating btn-lg btn-ins" type="button" role="button"><i class="fa fa-instagram"></i></a>
    </c:if>
<!--Pinterest-->
    <c:if test="${not empty pinterest and pinterest != 'https://'}">
		<a href="${pinterest}" class="btn-floating btn-lg btn-pin" type="button" role="button"><i class="fa fa-pinterest"></i></a>
    </c:if>
<!--Youtube-->
    <c:if test="${not empty youtube and youtube != 'https://'}">
		<a href="${pinterest}" class="btn-floating btn-lg btn-yt" type="button" role="button"><i class="fa fa-youtube"></i></a>
    </c:if>  
<!--Snapshat-->
    <c:if test="${not empty snapchat and snapchat != 'https://'}">
		<a href="${snapchat}" class="btn-floating btn-lg btn-yt" type="button" role="button"><i class="fa fa-snapchat"></i></a>
    </c:if>  
