package bean;
public class Menu implements java.io.Serializable {
    // 登録番号 privateにすることで外部から直接アクセスできないようにする
	
    private int id;
    // 商品ID
    private String menu_id;
    // 商品名
    private String menu_name;
    // 値段
    private int price;
    // ジャンル
    private String genre;
    // 提供フラグ
    private Boolean serve;
    
    // getterメソッド（値を取得するメソッド）登録番号を取得する
    public int getId() {
        return id;
    }
    // 商品IDを取得する
    public String getMenu_id() {
        return menu_id;
    }
    // 商品名を取得する
    public String getMenu_name() {
        return menu_name;
    }
    // 値段を取得する
    public int getPrice() {
        return price;
    }
    // ジャンルを取得する
    public String getGenre() {
        return genre;
    }
    // 提供フラグを取得する
    public Boolean getServe() {
        return serve;
    }

    // setterメソッド（値を設定するメソッド） 登録番号を設定する
    public void setId(int id) {
        // 引数idをフィールドidに代入している
        this.id = id;
    }   
    // 商品IDを設定する
    public void setMenu_id(String menu_id) {
        this.menu_id = menu_id;
    }
    // 商品名を設定する
    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }
    // 値段を設定する
    public void setPrice(int price) {
        this.price = price;
    }
    // ジャンルを設定する
    public void setGenre(String genre) {
        this.genre = genre;
    }
    // 提供フラグを設定する
    public void setServe(Boolean serve) {
        this.serve = serve;
    }
 
}