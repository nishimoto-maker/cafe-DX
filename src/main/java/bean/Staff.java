package been;

public class Staff implements java.io.Serializable {

    private int id;
    private String staff_id;
    private String staff_name;
    private String password;

    public int getId() {
        return id;
    }

    public String getStaff_id() {
        return staff_id;
    }

    public String getStaff_name() {
        return staff_name;
    }
    
    public String getPassword() {
        return password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setStaff_id(String staff_id) {
        this.staff_id = staff_id;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public void setStaff_name(String staff_name) {
        this.staff_name = staff_name;
    }
}