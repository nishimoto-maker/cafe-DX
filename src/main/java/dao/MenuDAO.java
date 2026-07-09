package dao;

// SQL関連
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Menu;


// DAOクラス（DB操作を担当するクラス）
public class MenuDAO extends DAO {

    // 商品名検索
    public List<Menu> search(String keyword) throws Exception {
        // 商品情報を保存するリスト
        List<Menu> list = new ArrayList<>();

        // データベース接続
        Connection con = getConnection();
        // SQL文
        PreparedStatement st = con.prepareStatement(
            "select * from menu where menu_name like ? and menu_id <> ?"
        );
        // プレースホルダに値をセット
        st.setString(1, "%" + keyword + "%");
        st.setString(2, "adm");

        // SQL実行
        ResultSet rs = st.executeQuery();
        // 検索結果を1行ずつ取り出す
        while (rs.next()) {

            // 商品オブジェクト作成
            Menu m = new Menu();

            // DBデータ → Menuオブジェクト
            m.setMenu_id(rs.getString("menu_id"));
            m.setMenu_name(rs.getString("menu_name"));
            m.setPrice(rs.getInt("price"));
            m.setGenre(rs.getString("genre"));
            m.setServe(rs.getBoolean("serve"));

            // リストに追加
            list.add(m);
        }

        // SQL終了
        rs.close();
        st.close();
        con.close();

        // 予約リストを返す
        return list;
    }
    
    // ジャンルごとの商品一覧取得
    public List<Menu> findBySchool(String genre) throws Exception {
        // 科目情報を保存するリスト
        List<Menu> list = new ArrayList<>();

        // データベース接続
        Connection con = getConnection();
        // SQL文
        PreparedStatement st = con.prepareStatement(
            "select * from menu where genre = ?"
        );
        // プレースホルダに値をセット
        st.setString(1, genre);

        // SQL実行
        ResultSet rs = st.executeQuery();

        // 検索結果を1行ずつ取り出す
        while (rs.next()) {
        	
        	// 商品オブジェクト作成
            Menu m = new Menu();
            
            // DBデータ → Menuオブジェクト
            m.setMenu_id(rs.getString("menu_id"));
            m.setMenu_name(rs.getString("menu_name"));
            m.setPrice(rs.getInt("price"));
            m.setGenre(rs.getString("genre"));
            m.setServe(rs.getBoolean("serve"));

            // リストに追加
            list.add(m);
        }

        // SQL終了
        rs.close();
        st.close();
        con.close();

        // 予約リスト返却
        return list;
    }

    // 商品情報を追加
    public int insert(Menu menu) throws Exception {

        // DB接続
        Connection con = getConnection();

        // INSERT文
        PreparedStatement st = con.prepareStatement(
            "insert into menu(menu_id, menu_name, price, genre, serve) values(?, ?, ?, ?, ?)"
        );

        // 商品ID
        st.setString(1, menu.getMenu_id());
        // 商品名
        st.setString(2, menu.getMenu_name());
        // 値段
        st.setInt(3, menu.getPrice());
        // ジャンル
        st.setString(4, menu.getGenre());
        // 提供フラグ
        st.setBoolean(5, menu.getServe());

        // SQL実行
        int line = st.executeUpdate();

        // 終了処理
        st.close();
        con.close();


        // 追加された行数を返す
        return line;
    }
     
    // 重複確認用
    public boolean isExist(String menu_id) throws Exception {
    	
    	// DB接続を取得
        Connection con = getConnection();
        
        // SQLを準備
        PreparedStatement st = con.prepareStatement(
            "select * from menu where menu_id = ?"
        );
        
        // 1つ目の?に商品IDをセット
        st.setString(1, menu_id);

        // SQLを実行（SELECTなのでexecuteQuery）
        ResultSet rs = st.executeQuery();

        boolean exists = rs.next();

        // リソースを解放（必ず閉じる）
        rs.close();
        st.close();
        con.close();

        return exists;
    }
}