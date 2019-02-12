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




public class ${adapterName}Adapter extends BaseRecyclerViewAdapter<${beanName}> {


    public ${adapterName}Adapter(Context mContext, List<${beanName}> mList) {
        super(mContext, mList);
    }

    @Override
    public RecyclerView.ViewHolder onCreateMyViewHolder(ViewGroup parent, int viewType) {
        return new ContentViewHolder(inflater.inflate(R.layout.${itemLayoutName}, parent, false));
    }

    @Override
    public void onBindMyViewHolder(RecyclerView.ViewHolder holder, int position) {
        setData((ContentViewHolder) holder, position);
    }


    //设置相关数据
    private void setData(ContentViewHolder holder, int position) {

    }


    public class ContentViewHolder extends RecyclerView.ViewHolder {

        public ContentViewHolder(View itemView) {
            super(itemView);
            ButterKnife.bind(this, itemView);
        }
    }
}
