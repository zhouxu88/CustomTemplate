<?xml version="1.0"?>
<recipe>

	<instantiate from="root/src/app_package/MyAdapter.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/${adapterName}Adapter.java" />

	<instantiate from="root/src/app_package/BaseRecyclerViewAdapter.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/BaseRecyclerViewAdapter.java" />

	<instantiate from="root/src/app_package/MyBean.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/${beanName}.java" />

	<instantiate from="root/res/layout/item_layout.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutName}.xml" />

    
</recipe>