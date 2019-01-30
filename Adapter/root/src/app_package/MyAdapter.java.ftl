package ${packageName};

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.yjjk.tempsteward.R;
import com.yjjk.tempsteward.bean.AllowanceListBean;
import com.yjjk.tempsteward.helper.RecyclerViewAdapterHelper;
import com.yjjk.tempsteward.ui.allowance.IOnClickAllowanceItemListener;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;


/**
 * 关怀金列表的适配器
 * <p>
 * 作者： 周旭 on 2017/4/25/0025.
 * 邮箱：374952705@qq.com
 * 博客：http://www.jianshu.com/u/56db5d78044d
 */

public class ${adapterName}Adapter extends RecyclerViewAdapterHelper<${beanName}> {


    public ${adapterName}Adapter(Context mContext, List<${beanName}> mList) {
        super(mContext, mList);
    }

    @Override
    public RecyclerView.ViewHolder onCreateMyViewHolder(ViewGroup parent, int viewType) {
        return new ${adapterName}ViewHolder(inflater.inflate(R.layout.${itemLayoutName}, parent, false));
    }

    @Override
    public void onBindMyViewHolder(RecyclerView.ViewHolder holder, int position) {
        setData((${adapterName}ViewHolder) holder, position);
    }


    //设置相关数据
    private void setData(${adapterName}ViewHolder holder, int position) {

    }


    public class ${adapterName}ViewHolder extends RecyclerView.ViewHolder {

        public ${adapterName}ViewHolder(View itemView) {
            super(itemView);
            ButterKnife.bind(this, itemView);
        }
    }
}
