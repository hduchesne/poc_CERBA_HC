<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:url var="imgUrl" value="${currentNode.url}" context="/" />

<svg width="1439" height="730" viewBox="0 0 1439 730" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <path opacity="0.2" d="M458.5 635.5C167.997 654.31 33.5 576 -2 549V0H1439V651C1202.5 827 894.057 601.465 661.5 620.5C521 632 528 631 458.5 635.5Z" fill="url(#paint0_linear)"/>
    <path opacity="0.2" d="M1439 0H-1V548.5C422 512.5 396.5 736.5 813.5 659.5C1038.82 617.894 1225.5 730.5 1439 651.5V0Z" fill="url(#paint1_linear)"/>
    <mask id="mask0" mask-type="alpha" maskUnits="userSpaceOnUse" x="-1" y="0" width="1440" height="649">
        <path d="M-1 0H1439V648.5C1115 493.5 1061 729 628 603.5C407.927 539.715 293 480 -1 544V0Z" fill="url(#paint2_linear)"/>
    </mask>
    <g mask="url(#mask0)">
        <rect width="1442" height="962" fill="url(#pattern0)"/>
    </g>
    <g style="mix-blend-mode:multiply">
        <path d="M-1 0H1439V649C1115 494 1061 729.5 628 604C407.927 540.215 293 480.5 -1 544.5V0Z" fill="url(#paint3_linear)" fill-opacity="0.55"/>
    </g>
    <g style="mix-blend-mode:multiply">
        <path d="M-1 0H1439V263.5H-1V0Z" fill="url(#paint4_linear)"/>
    </g>
    <defs>
        <pattern id="pattern0" patternContentUnits="objectBoundingBox" width="1" height="1">
            <use xlink:href="#image0" transform="translate(-0.00010255) scale(0.000976763 0.00146413)"/>
        </pattern>
        <linearGradient id="paint0_linear" x1="40.4996" y1="359.002" x2="1678.5" y2="802.502" gradientUnits="userSpaceOnUse">
            <stop stop-color="#0470DC"/>
            <stop offset="1" stop-color="#00ABC8"/>
        </linearGradient>
        <linearGradient id="paint1_linear" x1="80.5001" y1="571.5" x2="1439" y2="-479.999" gradientUnits="userSpaceOnUse">
            <stop stop-color="#1C449C"/>
            <stop offset="1" stop-color="#16A1DB"/>
        </linearGradient>
        <linearGradient id="paint2_linear" x1="-0.999978" y1="-259.5" x2="1857.5" y2="914.499" gradientUnits="userSpaceOnUse">
            <stop stop-color="#1C449C"/>
            <stop offset="1" stop-color="#00B2E2"/>
        </linearGradient>
        <linearGradient id="paint3_linear" x1="-0.99984" y1="-259" x2="1857.5" y2="914.999" gradientUnits="userSpaceOnUse">
            <stop stop-color="#1C449C"/>
            <stop offset="1" stop-color="#00B2E2"/>
        </linearGradient>
        <linearGradient id="paint4_linear" x1="719" y1="-74.5" x2="719" y2="263.5" gradientUnits="userSpaceOnUse">
            <stop stop-color="#1C449C" stop-opacity="0.9"/>
            <stop offset="1" stop-color="#1C449C" stop-opacity="0"/>
        </linearGradient>
        <image id="image0" width="1024" height="683" xlink:href="${imgUrl}"/>
    </defs>
</svg>