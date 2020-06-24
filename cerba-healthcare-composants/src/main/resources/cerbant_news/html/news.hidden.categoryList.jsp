<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>


<c:set var="title" value="${fn:escapeXml(currentNode.displayableName)}"/>

<c:set var="imgNode" value="${currentNode.properties['image'].node}"/>
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
        <template:module view="hidden.cerba.img" node="${imgNode}" editable="false">
            <template:param name="class" value="img-fluid w-100"/>
        </template:module>
    </a>
    <div class="portfolio-caption">
        <h4>${title}</h4>
        <p class="text-muted">
            ${categories}
        </p>
    </div>
</div>