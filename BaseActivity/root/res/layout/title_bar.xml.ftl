<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="100dp"
    android:background="@color/white">

    <TextView
        android:id="@+id/title_bart_tv_left"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_centerVertical="true"
        android:layout_marginLeft="20dp"
        android:drawableLeft="@drawable/fanhui_black"
        android:drawablePadding="6dp"
        android:text="返回"
        android:textColor="#000"
        android:textSize="16sp"
        android:textStyle="bold" />

    <TextView
        android:id="@+id/title_bart_tv_middle"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_centerInParent="true"
        android:layout_marginLeft="20sp"
        android:text="标题"
        android:textColor="#000"
        android:textSize="18sp"
        android:textStyle="bold" />

    <TextView
        android:id="@+id/title_bart_tv_right"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_alignParentRight="true"
        android:layout_centerVertical="true"
        android:layout_marginRight="20sp"
        android:text="" />


</RelativeLayout>