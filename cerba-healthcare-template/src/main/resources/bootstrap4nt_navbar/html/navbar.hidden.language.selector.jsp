<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:set var="localFormat" value="doubleLetter"/>
<ui:initLangBarAttributes activeLanguagesOnly="${renderContext.liveMode}"/>
<ui:displayLanguageSwitchLink var="renderedLanguage" languageCode="${currentResource.locale}"
    display="false" linkKind="${localFormat}"/>
<div class="btn-group">
    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        ${renderedLanguage}
    </button>
    <div class="dropdown-menu dropdown-menu-right">
        <c:forEach items="${requestScope.languageCodes}" var="language">
            <ui:displayLanguageSwitchLink var="renderedLanguage" urlVar="_url_" languageCode="${language}"
                display="false" linkKind="${localFormat}"/>
            <c:if test="${language ne currentResource.locale}">
                <c:url var="url" value="${_url_}" context="/"/>
                <a class="dropdown-item" href="${url}">${renderedLanguage}</a>
            </c:if>
        </c:forEach>
    </div>
</div>