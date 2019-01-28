<?xml version="1.0"?>
<recipe>

	<instantiate from="root/src/app_package/SplashActivity.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/SplashActivity.java" />

	<instantiate from="root/res/layout/activity_splash.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/activity_splash.xml" />

    <merge from="root/AndroidManifest.xml.ftl"
           to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    
</recipe>