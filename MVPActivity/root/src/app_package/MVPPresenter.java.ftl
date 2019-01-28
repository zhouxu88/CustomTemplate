package ${packageName};

/**
 * @author 周旭
 * @e-mail 374952705@qq.com
 * @time 2019/1/24
 */


public class ${activityName}Presenter extends BasePresenter<${activityName}Model, ${activityName}View> {
    private static final String TAG = "MVPPresenter";
    public ${activityName}Presenter(Context context, ${activityName}View view) {
        super(context, view);
        mModel = new ${activityName}Model();
    }

    public void getData() {
        mModel.getData()
                .subscribe(new BaseObserver<MVPBean>(mContext, MainConstant.SHOW_LOADING_DIALOG, "") {
                    @Override
                    public void onSuccess(MVPBean mvpBean) {
                        Log.i(TAG, "result: " + new Gson().toJson(mvpBean));
                        mView.getDataSuccess(mvpBean);
                    }

                    @Override
                    public void onFailure(String errorMsg) {
                        Log.i(TAG, "onFailure: " + errorMsg);
                        mView.getDataFailure(errorMsg);
                    }
                });
    }

}
