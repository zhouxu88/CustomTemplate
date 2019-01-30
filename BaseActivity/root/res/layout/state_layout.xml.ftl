<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:background="#fff"
    android:layout_height="match_parent">

    <LinearLayout
        android:id="@+id/state_layout_error"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:layout_centerInParent="true"
        android:gravity="center"
        android:orientation="vertical">

        <ImageView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:src="@drawable/no_net" />

        <Button
            android:id="@+id/state_layout_error_bt"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:background="@null"
            android:text="网络异常，点击重新加载"
            android:textColor="#000" />
    </LinearLayout>

    <LinearLayout
        android:id="@+id/state_layout_empty"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:layout_centerInParent="true"
        android:orientation="vertical"
        android:gravity="center"
        android:visibility="gone">

        <ImageView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:src="@drawable/no_data" />

        <Button
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:background="@null"
            android:text="暂无数据"
            android:textColor="#000" />
    </LinearLayout>
</RelativeLayout>