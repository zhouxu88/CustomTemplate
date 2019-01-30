<?xml version="1.0"?>
<recipe>

	<instantiate from="root/src/app_package/BaseActivity.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/BaseActivity.java" />

	<instantiate from="root/res/layout/activity_base.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/activity_base.xml" />

	<instantiate from="root/res/layout/title_bar.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/title_bar.xml" />

	<instantiate from="root/res/layout/state_layout.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/state_layout.xml" />

    <merge from="root/AndroidManifest.xml.ftl"
           to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    
</recipe>
