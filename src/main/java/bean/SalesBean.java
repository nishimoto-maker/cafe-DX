package bean;

import java.io.Serializable;
import java.sql.Date;

public class SalesBean implements Serializable {

    private Date salesDate;
    private int totalSales;

    public Date getSalesDate() {
        return salesDate;
    }

    public void setSalesDate(Date salesDate) {
        this.salesDate = salesDate;
    }

    public int getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(int totalSales) {
        this.totalSales = totalSales;
    }
}
