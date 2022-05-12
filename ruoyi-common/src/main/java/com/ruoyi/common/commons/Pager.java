package com.ruoyi.common.commons;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.*;
import java.util.function.Predicate;

@ApiModel(value="分页信息",description="全局分页信息")
public class Pager<T> implements IPage<T> {
    private static final long serialVersionUID = 8545996863226528798L;
    @ApiModelProperty(value="分页数据",name="records")
    private List<T> records;

    @ApiModelProperty(value="总条数",name="total",example="100")
    private long total;

    @ApiModelProperty(value="每页数据量",name="size",example="30")
    private long size;

    @ApiModelProperty(value="页码",name="current",example="1")
    private long current;

    @ApiModelProperty(value="排序参数",name="orders")
    private List<OrderItem> orders;

    @ApiModelProperty(hidden=true)
    private boolean optimizeCountSql;

    @ApiModelProperty(hidden=true)
    private boolean isSearchCount;

    @ApiModelProperty(hidden=true)
    private boolean hitCount;

    @ApiModelProperty(hidden=true)
    private String countId;

    @ApiModelProperty(value="最大限制条数",name="size",example="300")
    private Long maxLimit;

    @ApiModelProperty(value="查询参数",name="form",example="{}")
    private T form;

    public Pager() {
        this.records = Collections.emptyList();
        this.total = 0L;
        this.size = 10L;
        this.current = 1L;
        this.orders = new ArrayList();
        this.optimizeCountSql = true;
        this.isSearchCount = true;
        this.hitCount = false;
    }

    public Pager(long current, long size) {
        this(current, size, 0L);
    }

    public Pager(long current, long size, long total) {
        this(current, size, total, true);
    }

    public Pager(long current, long size, boolean isSearchCount) {
        this(current, size, 0L, isSearchCount);
    }

    public Pager(long current, long size, long total, boolean isSearchCount) {
        this.records = Collections.emptyList();
        this.total = 0L;
        this.size = 10L;
        this.current = 1L;
        this.orders = new ArrayList();
        this.optimizeCountSql = true;
        this.isSearchCount = true;
        this.hitCount = false;
        if (current > 1L) {
            this.current = current;
        }

        this.size = size;
        this.total = total;
        this.isSearchCount = isSearchCount;
    }

    public boolean hasPrevious() {
        return this.current > 1L;
    }

    public boolean hasNext() {
        return this.current < this.getPages();
    }

    public List<T> getRecords() {
        return this.records;
    }

    public Pager<T> setRecords(List<T> records) {
        this.records = records;
        return this;
    }

    public long getTotal() {
        return this.total;
    }

    public Pager<T> setTotal(long total) {
        this.total = total;
        return this;
    }

    public long getSize() {
        return this.size;
    }

    public Pager<T> setSize(long size) {
        this.size = size;
        return this;
    }

    public long getCurrent() {
        return this.current;
    }

    public Pager<T> setCurrent(long current) {
        this.current = current;
        return this;
    }

    public String countId() {
        return this.getCountId();
    }

    public Long maxLimit() {
        return this.getMaxLimit();
    }

    private String[] mapOrderToArray(Predicate<OrderItem> filter) {
        List<String> columns = new ArrayList(this.orders.size());
        this.orders.forEach((i) -> {
            if (filter.test(i)) {
                columns.add(i.getColumn());
            }

        });
        return (String[])columns.toArray(new String[0]);
    }

    private void removeOrder(Predicate<OrderItem> filter) {
        for(int i = this.orders.size() - 1; i >= 0; --i) {
            if (filter.test(this.orders.get(i))) {
                this.orders.remove(i);
            }
        }

    }

    public Pager<T> addOrder(OrderItem... items) {
        this.orders.addAll(Arrays.asList(items));
        return this;
    }

    public Pager<T> addOrder(List<OrderItem> items) {
        this.orders.addAll(items);
        return this;
    }

    /** @deprecated */
    @Deprecated
    @ApiModelProperty(hidden=true)
    public Pager<T> setAscs(List<String> ascs) {
        return CollectionUtils.isNotEmpty(ascs) ? this.setAsc((String[])ascs.toArray(new String[0])) : this;
    }

    /** @deprecated */
    @Deprecated
    @ApiModelProperty(hidden=true)
    public Pager<T> setAsc(String... ascs) {
        this.removeOrder(OrderItem::isAsc);
        String[] var2 = ascs;
        int var3 = ascs.length;

        for(int var4 = 0; var4 < var3; ++var4) {
            String s = var2[var4];
            this.addOrder(OrderItem.asc(s));
        }

        return this;
    }

    /** @deprecated */
    @Deprecated
    @ApiModelProperty(hidden=true)
    public Pager<T> setDescs(List<String> descs) {
        if (CollectionUtils.isNotEmpty(descs)) {
            this.removeOrder((item) -> {
                return !item.isAsc();
            });
            Iterator var2 = descs.iterator();

            while(var2.hasNext()) {
                String s = (String)var2.next();
                this.addOrder(OrderItem.desc(s));
            }
        }

        return this;
    }

    /** @deprecated */
    @Deprecated
    @ApiModelProperty(hidden=true)
    public Pager<T> setDesc(String... descs) {
        this.setDescs(Arrays.asList(descs));
        return this;
    }

    public List<OrderItem> orders() {
        return this.getOrders();
    }

    public boolean optimizeCountSql() {
        return this.optimizeCountSql;
    }

    public boolean isOptimizeCountSql() {
        return this.optimizeCountSql();
    }

    @ApiModelProperty(hidden=true)
    public boolean isSearchCount() {
        return this.total < 0L ? false : this.isSearchCount;
    }

    public Pager<T> setSearchCount(boolean isSearchCount) {
        this.isSearchCount = isSearchCount;
        return this;
    }

    public Pager<T> setOptimizeCountSql(boolean optimizeCountSql) {
        this.optimizeCountSql = optimizeCountSql;
        return this;
    }

    public void hitCount(boolean hit) {
        this.hitCount = hit;
    }

    public void setHitCount(boolean hit) {
        this.hitCount = hit;
    }

    public boolean isHitCount() {
        return this.hitCount;
    }

    public List<OrderItem> getOrders() {
        return this.orders;
    }

    public void setOrders(final List<OrderItem> orders) {
        this.orders = orders;
    }

    public String getCountId() {
        return this.countId;
    }

    public void setCountId(final String countId) {
        this.countId = countId;
    }

    public Long getMaxLimit() {
        return this.maxLimit;
    }

    public void setMaxLimit(final Long maxLimit) {
        this.maxLimit = maxLimit;
    }

    public T getForm() {
        return form;
    }

    public void setForm(T form) {
        this.form = form;
    }

    @Override
    @ApiModelProperty(hidden=true)
    public long getPages() {
        return IPage.super.getPages();
    }
}
