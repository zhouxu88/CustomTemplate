<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/activity_base_root"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:fitsSystemWindows="true"
    android:orientation="vertical"
    >

    <include
        android:id="@+id/activity_base_title_bar"
        android:visibility="gone"
        layout="@layout/title_bar" />

    <include
        android:id="@+id/activity_base_state_layout"
        android:visibility="gone"
        layout="@layout/state_layout"/>

</LinearLayout>
