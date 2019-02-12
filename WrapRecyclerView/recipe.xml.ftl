<?xml version="1.0"?>
<recipe>

	<instantiate from="root/src/app_package/WrapAdapter.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/WrapAdapter.java" />

	<instantiate from="root/src/app_package/WrapRecyclerView.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/WrapRecyclerView.java" />

	<instantiate from="root/src/app_package/BaseRecyclerViewAdapter.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/BaseRecyclerViewAdapter.java" />

    
</recipe>