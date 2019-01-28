package ${packageName};

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

import com.yjjk.tempsteward.R;
import com.yjjk.tempsteward.base.BaseActivity;
import com.yjjk.tempsteward.bean.IsBindPhoneBean;
import com.yjjk.tempsteward.constant.MainConstant;
import com.yjjk.tempsteward.ui.installguide.InstallGuidePageActivity;
import com.yjjk.tempsteward.ui.isbindphone.IIsBindPhoneView;
import com.yjjk.tempsteward.ui.isbindphone.IsBindPhonePresenter;
import com.yjjk.tempsteward.ui.login.LoginActivity;
import com.yjjk.tempsteward.ui.main.MainActivity;
import com.yjjk.tempsteward.utils.SharedPrefUtils;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

/**
 * 闪屏页（启动页）
 */
public class SplashActivity extends AppCompatActivity {

    private static final String TAG = "SplashActivity";
    private static final int SPLASH_TOTAL = 2; //闪屏时间,单位：秒


    private Context mContext;
    private TimerTask timerTask;
    private String sessionId;
    private boolean isGotoMain; //是否跳转到首页

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        mContext = this;
        init();
    }


    //倒计时的异步任务
    class TimerTask extends AsyncTask<Void, Integer, Void> {

        private int startCount;

        public TimerTask(int startCount) {
            this.startCount = startCount;
        }

        @Override
        protected Void doInBackground(Void... params) {
            while (startCount > 0) {
                startCount--;
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                publishProgress(startCount); //给更新ui的方法onProgressUpdate传递数据
            }
            return null;
        }

        @Override
        protected void onProgressUpdate(Integer... values) {
            super.onProgressUpdate(values);
//            timeTaskTv.setText(values[0] + " s跳过");
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            toMainOrLogin(isGotoMain);
        }
    }

    /**
     * 初始化判断，是否为第一次使用（第一次，展示引导页）
     */
    private void init() {
        boolean isFirstIn = SharedPrefUtils.getBoolean(mContext, MainConstant.IS_FIRST_IN, true);
        if (isFirstIn) {
            //第一次使用,跳转到安装引导页
            SharedPrefUtils.writeBoolean(mContext, MainConstant.IS_FIRST_IN, false);
            Intent intent = new Intent(mContext, InstallGuidePageActivity.class);
            startActivity(intent);
            finish();
        } else {
            //判断是否登录
            if (!TextUtils.isEmpty(sessionId)) {
                isBindPhonePresenter.isBindPhone();
            } else {
                isGotoMain = false;
                timerTask.execute(); //开启倒计时任务
            }
        }
    }

    //跳转到主页面或者登录页面
    private void toMainOrLogin(boolean isToMain) {
        if (isToMain) {
            Intent intent = new Intent(mContext, MainActivity.class);
            startActivity(intent);
            finish();
        } else {
            Intent intent = new Intent(mContext, LoginActivity.class);
            startActivity(intent);
            finish();
        }

    }
}
