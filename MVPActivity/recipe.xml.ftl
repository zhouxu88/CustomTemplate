<?xml version="1.0"?>
<recipe>

	<instantiate from="root/src/app_package/MVPActivity.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/${activityName}Activity.java" />

	<instantiate from="root/src/app_package/MVPModel.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/${activityName}Model.java" />

	<instantiate from="root/src/app_package/MVPPresenter.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/${activityName}Presenter.java" />

	<instantiate from="root/src/app_package/MVPView.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/${activityName}View.java" />

	<instantiate from="root/res/layout/activity_mvp.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/activity_mvp.xml" />

    <merge from="root/AndroidManifest.xml.ftl"
           to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    
</recipe>