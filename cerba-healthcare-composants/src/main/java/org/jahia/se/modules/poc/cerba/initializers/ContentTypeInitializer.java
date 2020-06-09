package org.jahia.se.modules.poc.cerba.initializers;

import org.jahia.services.content.JCRPropertyWrapper;
import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.NodeTypeRegistry;
import org.jahia.services.content.nodetypes.ValueImpl;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;
import org.jahia.services.content.nodetypes.renderer.AbstractChoiceListRenderer;
import org.jahia.services.content.nodetypes.renderer.ModuleChoiceListRenderer;
import org.jahia.services.render.RenderContext;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.PropertyType;
import javax.jcr.RepositoryException;
import javax.jcr.Value;
import javax.jcr.nodetype.NoSuchNodeTypeException;
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
        //Create the list of ChoiceListValue to return
        List<ChoiceListValue> choiceListValues = new ArrayList<ChoiceListValue>();

        try {
            nodeTypeRegistry.getNodeType("jmix:droppableContent").getDeclaredSubtypes();
            //TODO to be continued

        } catch (NoSuchNodeTypeException e) {
            e.printStackTrace();
        }

        if (context == null) {
            return myChoiceList;
        }

        HashMap<String, Object> myPropertiesMap = null;


        //TODO Add the page itself
        myPropertiesMap = new HashMap<String, Object>();
        myPropertiesMap.put("addMixin","game4mix:externalVideoLink");
        choiceListValues.add(new ChoiceListValue("external",myPropertiesMap,new ValueImpl("external", PropertyType.STRING, false)));

        //internalLink
        myPropertiesMap = new HashMap<String, Object>();
        myPropertiesMap.put("addMixin","game4mix:internalVideoLink");
        choiceListValues.add(new ChoiceListValue("internal",myPropertiesMap,new ValueImpl("internal", PropertyType.STRING, false)));

        //Return the list
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
}
