package ${packageName};

import android.content.Context;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.List;

import pub.devrel.easypermissions.AppSettingsDialog;
import pub.devrel.easypermissions.EasyPermissions;

/**
 * @author 周旭
 * @company 义金健康
 * @e-mail 374952705@qq.com
 * @time 2019/1/30
 * @descripe
 */


public class BaseActivity extends AppCompatActivity implements EasyPermissions.PermissionCallbacks {

    private static final String TAG = "BaseActivity";
    public static final int NORMAL = 1;
    public static final int NET_ERROR = 2;
    public static final int EMPTY = 3;
    private Context mContext;

    LinearLayout mRootBaseView;//根布局

    View mStateLayout;//include的state_layout
    LinearLayout ll_page_state_error;//stateLayout网络错误的布局
    LinearLayout ll_page_state_empty;//stateLayout无数据的布局
    Button btReload;//网络错误重新加载的布局


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //注意：这里的setContentView必须有super才可以，需要走父类方法
        super.setContentView(R.layout.activity_base);

        mContext = this;
        initBaseView();
        initStatusBar();
    }

    public void initBaseView() {
        mRootBaseView = findViewById(R.id.activity_base_root);
        mStateLayout = findViewById(R.id.activity_base_state_layout);
        btReload = findViewById(R.id.state_layout_error_bt);
        ll_page_state_empty = findViewById(R.id.state_layout_empty);
        ll_page_state_error = findViewById(R.id.state_layout_error);
        btReload.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                reloadInterface.reloadClickListener();
            }
        });
    }


    /**
     * 初始化状态栏
     */
    private void initStatusBar() {
        Window window = getWindow();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
//            window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE);
            window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
            window.setStatusBarColor(Color.TRANSPARENT);
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        }
    }

    /**
     * 必须重写setContentView注意不能够添加这行代码 目的将当前界面的布局添加到BaseActivity中去
     * super.setContentView(R.layout.activity_base);
     */
    @Override
    public void setContentView(int layoutResID) {
        View view = getLayoutInflater().inflate(layoutResID, null);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT);
        if (null != mRootBaseView) {
            mRootBaseView.addView(view, lp);
        }
    }


    /**
     * 切换页面的布局
     *
     * @param pageState 页面状态 NORMAL  EMPTY  ERROR
     */
    public void changePageState(int pageState) {
        switch (pageState) {
            case NORMAL:
                mStateLayout.setVisibility(View.GONE);
                break;
            case NET_ERROR:
                mStateLayout.setVisibility(View.VISIBLE);
                ll_page_state_error.setVisibility(View.VISIBLE);
                ll_page_state_empty.setVisibility(View.GONE);
                break;
            case EMPTY:
                mStateLayout.setVisibility(View.VISIBLE);
                ll_page_state_error.setVisibility(View.GONE);
                ll_page_state_empty.setVisibility(View.VISIBLE);
                break;
        }


    }


    //网络错误重新加载的接口
    public ReloadInterface reloadInterface;

    public void setReloadInterface(ReloadInterface reloadInterface) {
        this.reloadInterface = reloadInterface;
    }

    public interface ReloadInterface {
        void reloadClickListener();
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        // Forward results to EasyPermissions
        //跳转到onPermissionsGranted或者onPermissionsDenied去回调授权结果
        EasyPermissions.onRequestPermissionsResult(requestCode, permissions, grantResults, this);
    }

    @Override
    public void onPermissionsGranted(int requestCode, List<String> perms) {
        //同意授权
    }

    //拒绝授权
    @Override
    public void onPermissionsDenied(int requestCode, List<String> perms) {
        // Some permissions have been denied
        Log.i(TAG, "onPermissionsDenied:" + requestCode + ":" + perms.size());
        // (Optional) Check whether the user denied any permissions and checked "NEVER ASK AGAIN."
        // This will display a dialog directing them to enable the permission in app settings.
        if (EasyPermissions.somePermissionPermanentlyDenied(this, perms)) {
            new AppSettingsDialog.Builder(this).build().show();
        }
    }




}
