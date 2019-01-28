package ${packageName};

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class ${activityName}Activity extends AppCompatActivity implements ${activityName}View{
 private Context mContext;
    private ${activityName}Presenter m${activityName}Presenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mvp);

        mContext=this;
        m${activityName}Presenter=new ${activityName}Presenter(mContext,this);
    }
}
