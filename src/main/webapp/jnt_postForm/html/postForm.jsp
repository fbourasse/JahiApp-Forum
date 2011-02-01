<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:linker property="j:bindedComponent"/>
<template:addResources type="css" resources="forum.css"/>
<c:set var="linked" value="${uiComponents:getBindedComponentPath(currentNode, renderContext, 'j:bindedComponent')}"/>
<template:addResources type="css" resources="forum.css"/>

<a name="threadPost"></a>
<template:tokenizedForm>
    <form action="${url.base}${linked}/*" method="post">
        <input type="hidden" name="nodeType" value="jnt:post"/>
        <input type="hidden" name="redirectTo" value="${url.base}${renderContext.mainResource.node.path}"/>
        <input type="hidden" name="newNodeOutputFormat" value="${renderContext.mainResource.template}.html"/>
        <input type="hidden" name="autoAssignRole" value="owner"/>

        <div class="post-reply"><!--start post-reply-->
            <div class="forum-box forum-box-style2">
                <span class="forum-corners-top"><span></span></span>

                <div id="forum-Form"><!--start forum-Form-->
                    <h4 class="forum-h4-first">${currentNode.propertiesAsString['jcr:title']} : <fmt:message
                            key="reply"/></h4>

                    <fieldset>
                        <p class="field">
                            <input value="<c:if test="${functions:length(currentNode.nodes) > 0}"> Re:</c:if>${currentNode.propertiesAsString['threadSubject']}"
                                   type="text" size="35" id="forum_site" name="jcr:title"
                                   tabindex="1"/>
                        </p>

                        <p class="field">
                            <textarea rows="7" cols="35" id="jahia-forum-thread-${currentNode.UUID}" name="content"
                                      tabindex="2"></textarea>
                        </p>

                        <p class="forum_button">
                            <input type="reset" value="Reset" class="button" tabindex="3"/>

                            <input type="submit" value="Submit" class="button" tabindex="4"/>
                        </p>
                    </fieldset>
                </div>
                <!--stop forum-Form-->


                <div class="clear"></div>
                <span class="forum-corners-bottom"><span></span></span>
            </div>
        </div>
        <!--stop post-reply-->
    </form>
</template:tokenizedForm>