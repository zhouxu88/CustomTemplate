package ${packageName};

import android.content.Context;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 周旭
 * @company 义金健康
 * @e-mail 374952705@qq.com
 * @time 2019/2/11
 * @descripe
 */

public class WrapRecyclerView extends RecyclerView {

    private View emptyView;
    private WrapAdapter mWrapAdapter;
    private boolean shouldAdjustSpanSize;

    // 临时头部View集合,用于存储没有设置Adapter之前添加的头部
    private ArrayList<View> mTmpHeaderView = new ArrayList<>();
    // 临时尾部View集合,用于存储没有设置Adapter之前添加的尾部
    private ArrayList<View> mTmpFooterView = new ArrayList<>();

    public WrapRecyclerView(Context context) {
        super(context);
    }

    public WrapRecyclerView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public WrapRecyclerView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override
    public void setAdapter(Adapter adapter) {
        if (adapter instanceof WrapAdapter) {
            mWrapAdapter = (WrapAdapter) adapter;
            super.setAdapter(adapter);
        } else {
            mWrapAdapter = new WrapAdapter(adapter);
            for (View view : mTmpHeaderView) {
                mWrapAdapter.addHeaderView(view);
            }
            if (mTmpHeaderView.size() > 0) {
                mTmpHeaderView.clear();
            }

            for (View view : mTmpFooterView) {
                mWrapAdapter.addFooterView(view);
            }
            if (mTmpFooterView.size() > 0) {
                mTmpFooterView.clear();
            }

            super.setAdapter(mWrapAdapter);
        }

        if (shouldAdjustSpanSize) {
            mWrapAdapter.adjustSpanSize(this);
        }

        getWrappedAdapter().registerAdapterDataObserver(mDataObserver);
//        mDataObserver.onChanged();
//        checkIfEmpty();
    }

    /**
     * Retrieves the previously set wrap adapter or null if no adapter is set.
     *
     * @return The previously set adapter
     */
    @Override
    public WrapAdapter getAdapter() {
        return mWrapAdapter;
    }

    /**
     * Gets the real adapter
     *
     * @return T:
     * @version 1.0
     */
    public Adapter getWrappedAdapter() {
        if (mWrapAdapter == null) {
            throw new IllegalStateException("You must set a adapter before!");
        }
        return mWrapAdapter.getWrappedAdapter();
    }

    /**
     * Adds a header view
     *
     * @param view
     * @version 1.0
     */
    public void addHeaderView(View view) {
        if (null == view) {
            throw new IllegalArgumentException("the view to add must not be null!");
        } else if (mWrapAdapter == null) {
            mTmpHeaderView.add(view);
        } else {
            mWrapAdapter.addHeaderView(view);
        }
    }


    /**
     * Adds a footer view
     *
     * @param view
     * @version 1.0
     */
    public void addFooterView(View view) {
        if (null == view) {
            throw new IllegalArgumentException("the view to add must not be null!");
        } else if (mWrapAdapter == null) {
            mTmpFooterView.add(view);
        } else {
            mWrapAdapter.addFooterView(view);
        }
    }

    /**
     * Adds a footer view
     *
     * @param view
     * @param reverse
     */
    public void addFooterView(View view, boolean reverse) {
        if (null == view) {
            throw new IllegalArgumentException("the view to add must not be null!");
        } else if (mWrapAdapter == null) {
            mTmpFooterView.add(view);
        } else {
            mWrapAdapter.addFooterView(view, reverse);
        }
    }

    /**
     * remove headerView
     *
     * @param view
     */
    public void removeHeaderView(View view) {
        if (null == view) {
            throw new IllegalArgumentException("the view to remove must not be null!");
        } else if (mWrapAdapter != null) {
            mWrapAdapter.removeHeaderView(view);
        }
    }

    /**
     * remove footerView
     *
     * @param view
     */
    public void removeFooterView(View view) {
        if (null == view) {
            throw new IllegalArgumentException("the view to remove must not be null!");
        } else if (mWrapAdapter != null) {
            mWrapAdapter.removeFooterView(view);
        }
    }

    @Override
    public void setLayoutManager(LayoutManager layout) {
        super.setLayoutManager(layout);
        if (layout instanceof GridLayoutManager || layout instanceof StaggeredGridLayoutManager) {
            this.shouldAdjustSpanSize = true;
        }
    }

    /**
     * gets the headers view
     *
     * @return List:
     * @version 1.0
     */
    public List<View> getHeadersView() {
        if (mWrapAdapter == null) {
            throw new IllegalStateException("You must set a adapter before!");
        }
        return mWrapAdapter.getHeadersView();
    }

    /**
     * gets the footers view
     *
     * @return List:
     * @version 1.0
     */
    public List<View> getFootersView() {
        if (mWrapAdapter == null) {
            throw new IllegalStateException("You must set a adapter before!");
        }
        return mWrapAdapter.getFootersView();
    }

    /**
     * Setting the visibility of the header views
     *
     * @param shouldShow
     * @version 1.0
     */
    public void setFooterVisibility(boolean shouldShow) {
        if (mWrapAdapter == null) {
            throw new IllegalStateException("You must set a adapter before!");
        }
        mWrapAdapter.setFooterVisibility(shouldShow);
    }

    /**
     * Setting the visibility of the footer views
     *
     * @param shouldShow
     * @version 1.0
     */
    public void setHeaderVisibility(boolean shouldShow) {
        if (mWrapAdapter == null) {
            throw new IllegalStateException("You must set a adapter before!");
        }
        mWrapAdapter.setHeaderVisibility(shouldShow);
    }

    /**
     * get the count of headers
     *
     * @return number of headers
     * @version 1.0
     */
    public int getHeadersCount() {
        if (mWrapAdapter == null) {
            throw new IllegalStateException("You must set a adapter before!");
        }
        return mWrapAdapter.getHeadersCount();
    }

    /**
     * get the count of footers
     *
     * @return the number of footers
     * @version 1.0
     */
    public int getFootersCount() {
        if (mWrapAdapter == null) {
            throw new IllegalStateException("You must set a adapter before!");
        }
        return mWrapAdapter.getFootersCount();
    }

    private final AdapterDataObserver mDataObserver = new AdapterDataObserver() {

        @Override
        public void onChanged() {
            Log.e("aaa", "onChanged");
            if (mWrapAdapter != null) {
                mWrapAdapter.notifyDataSetChanged();
                checkIfEmpty();
            }
        }

        @Override
        public void onItemRangeInserted(int positionStart, int itemCount) {
            mWrapAdapter.notifyItemRangeInserted(positionStart, itemCount);
            Log.e("aaa", "onItemRangeInserted: " + itemCount);
            checkIfEmpty();
        }

        @Override
        public void onItemRangeChanged(int positionStart, int itemCount) {
            mWrapAdapter.notifyItemRangeChanged(positionStart, itemCount);
            Log.e("aaaa", "onItemRangeChanged: " + itemCount);
            checkIfEmpty();
        }

        @Override
        public void onItemRangeChanged(int positionStart, int itemCount, Object payload) {
            mWrapAdapter.notifyItemRangeChanged(positionStart, itemCount, payload);
            Log.e("aaa", "onItemRangeChanged: " + itemCount);
            checkIfEmpty();
        }

        @Override
        public void onItemRangeRemoved(int positionStart, int itemCount) {
            mWrapAdapter.notifyItemRangeRemoved(positionStart, itemCount);
            Log.e("aaa", "onItemRangeRemoved: " + itemCount);
            checkIfEmpty();
        }

        @Override
        public void onItemRangeMoved(int fromPosition, int toPosition, int itemCount) {
            mWrapAdapter.notifyItemMoved(fromPosition, toPosition);
            Log.e("aaa", "onItemRangeMoved: " + itemCount);
            checkIfEmpty();
        }
    };

    /**
     * 检查RecyclerView数据是否为空
     */
    void checkIfEmpty() {
        if (emptyView != null && getAdapter() != null) {
            final boolean emptyViewVisible =
                    getAdapter().getItemCount() == 0;
            emptyView.setVisibility(emptyViewVisible ? VISIBLE : GONE);
            setVisibility(emptyViewVisible ? GONE : VISIBLE);
        }
    }

    /**
     * 设置emptyView
     *
     * @param emptyView
     */
    public void setEmptyView(View emptyView) {
        this.emptyView = emptyView;
        checkIfEmpty();
    }
}