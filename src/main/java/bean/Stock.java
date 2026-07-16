package bean;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Stock implements Serializable {
    
    // ステータス定数
    public static final int STATUS_OUT_OF_STOCK = 0; // 在庫なし
    public static final int STATUS_IN_STOCK = 1;     // 在庫あり

    private Integer stock_id;     // 在庫ID
    private String menu_id;       // メニューID
    private Integer stock_count;  // 現在の在庫数
    private Integer change_count; // 変動数
    private String reason;        // 在庫変動の理由
    private LocalDateTime update_at; // 更新日時
    private Integer status;       // ステータス (0:在庫なし, 1:在庫あり)

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