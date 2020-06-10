package org.jahia.se.modules.poc.cerba.initializers;

import org.jahia.services.content.JCRPropertyWrapper;
import org.jahia.services.content.nodetypes.ExtendedNodeType;
import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.NodeTypeRegistry;
import org.jahia.services.content.nodetypes.ValueImpl;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;
import org.jahia.services.content.nodetypes.renderer.AbstractChoiceListRenderer;
import org.jahia.services.content.nodetypes.renderer.ModuleChoiceListRenderer;
import org.jahia.services.render.RenderContext;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.PropertyType;
import javax.jcr.RepositoryException;
import javax.jcr.Value;
import javax.jcr.nodetype.NoSuchNodeTypeException;
import javax.jcr.nodetype.NodeType;
import java.util.*;

@Component(service = ModuleChoiceListInitializer.class, immediate = true)
public class ContentTypeInitializer extends AbstractChoiceListRenderer implements ModuleChoiceListInitializer, ModuleChoiceListRenderer {
    private static final Logger logger = LoggerFactory.getLogger(ContentTypeInitializer.class);

    private String key="contentTypeInitializer";
    private NodeTypeRegistry nodeTypeRegistry;

    @Reference
    public void setNodeTypeRegistry(NodeTypeRegistry nodeTypeRegistry) {
        this.nodeTypeRegistry = nodeTypeRegistry;
    }

    @Override
    public List<ChoiceListValue> getChoiceListValues(ExtendedPropertyDefinition epd, String param, List<ChoiceListValue> values, Locale locale, Map<String, Object> context) {
        logger.debug("ContentTypeInitializer getChoiceListValues start");
        logger.debug("context : "+context.toString());

        final ExtendedNodeType contextType = (ExtendedNodeType) context.get("contextType");
        //Create the list of ChoiceListValue to return
        List<ChoiceListValue> choiceListValues = new ArrayList<ChoiceListValue>();

        try {
            JSONObject params= new JSONObject();
            if(!param.isEmpty())
                params = new JSONObject(param);

//            final String occurrence = params.optString("occurrence","single");
            final JSONArray types = params.optJSONArray("types");
            logger.info("params type name : "+types.toString());

            if(types.length() >0){
                Iterator<Object> typesIterator = types.iterator();
                while(typesIterator.hasNext()){
                    choiceListValues.addAll(this.getNodeTypeChoiceListValue((String)typesIterator.next(),contextType.getName()));
                }
            }else {
                //TODO to be continued.Need to refine the list to content allowed for the user and more...
                Iterator<NodeType> nodeTypeIterator = nodeTypeRegistry.getNodeType("jmix:droppableContent").getDeclaredSubtypes();
//                Iterator<NodeType> nodeTypeIterator = nodeTypeRegistry.getNodeType("jnt:content").getDeclaredSubtypes();
                while (nodeTypeIterator.hasNext()) {
                    NodeType nodeType = nodeTypeIterator.next();
                    logger.info("node type name : " + nodeType.getName());
                    choiceListValues.addAll(this.getNodeTypeChoiceListValue(nodeType.getName(),contextType.getName()));
                }
            }
        } catch (NoSuchNodeTypeException | JSONException e) {
            e.printStackTrace();
        }

        choiceListValues.add(new ChoiceListValue("jnt:page",null,new ValueImpl("jnt:page", PropertyType.STRING, false)));

        return choiceListValues;
    }

    @Override
    public void setKey(String key) {
        this.key = key;
    }

    @Override
    public String getKey() {
        return key;
    }

    @Override
    public String getStringRendering(RenderContext context, JCRPropertyWrapper propertyWrapper) throws RepositoryException {
        final StringBuilder sb = new StringBuilder();

        if (propertyWrapper.isMultiple()) {
            sb.append('{');
            final Value[] values = propertyWrapper.getValues();
            for (Value value : values) {
                sb.append('[').append(value.getString()).append(']');
            }
            sb.append('}');
        } else {
            sb.append('[').append(propertyWrapper.getValue().getString()).append(']');
        }

        return sb.toString();
    }

    @Override
    public String getStringRendering(Locale locale, ExtendedPropertyDefinition propDef, Object propertyValue) throws RepositoryException {
        return "[" + propertyValue.toString() + "]";
    }

    private List<ChoiceListValue> getNodeTypeChoiceListValue(String nodeTypeName, String contextTypeName) throws NoSuchNodeTypeException {
        List<ChoiceListValue> choiceListValues = new ArrayList<ChoiceListValue>();

        List<ExtendedNodeType> nodeTypes = nodeTypeRegistry.getNodeType(nodeTypeName).getSubtypesAsList();
        for(ExtendedNodeType nodeType : nodeTypes){
            logger.debug("[getNodeTypeChoiceListValue] node type name : "+nodeType.getName());
//            logger.info("node type alias : "+nodeType.getAlias());
            if(nodeType.getName().equals(contextTypeName))
                continue;
            choiceListValues.add(new ChoiceListValue(nodeType.getName(),null,new ValueImpl(nodeType.getName(), PropertyType.STRING, false)));
        }

        return choiceListValues;
    }
}
