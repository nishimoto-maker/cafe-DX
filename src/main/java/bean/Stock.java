package bean;

import java.time.LocalDateTime;

public class Stock {
    private Integer stock_id;
    private String menu_id;
    private Integer stock_count;
    private Integer change_count;
    private String reason;
    private LocalDateTime update_at;
    private Integer status;
    // 0:在庫なし, 1:在庫あり

    public Integer getStock_id() { return stock_id; }
    public void setStock_id(Integer stock_id) { this.stock_id = stock_id; }

    public String getMenu_id() { return menu_id; }
    public void setMenu_id(String menu_id) { this.menu_id = menu_id; }

    public Integer getStock_count() { return stock_count; }
    public void setStock_count(Integer stock_count) { this.stock_count = stock_count; }

    public Integer getChange_count() { return change_count; }
    public void setChange_count(Integer change_count) { this.change_count = change_count; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }

    public LocalDateTime getUpdate_at() { return update_at; }
    public void setUpdate_at(LocalDateTime update_at) { this.update_at = update_at; }

    public Integer getStatus() { return status; }
    public void setStatus(Integer status) { this.status = status; }
}