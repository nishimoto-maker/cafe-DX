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
    public List<Menu> search(String keyword, String sortBy) throws Exception {
        // 商品情報を保存するリスト
        List<Menu> list = new ArrayList<>();

        // データベース接続
        Connection con = getConnection();
        
        // SQL文
        String sql = "select * from menu where 1 = 1";
        // 検索条件が送信されていればwhere句追加
        if (keyword != null && !keyword.isEmpty()) {
        	sql += (" and menu_name like ?");
        }
        
        if (sortBy != null && !sortBy.isEmpty()) {
        	sql += (" and genre like ?");
        }
        
        PreparedStatement st = con.prepareStatement(sql);
        
        int index = 1;
        if (keyword != null && !keyword.isEmpty()) {
        	st.setString(index++, "%" + keyword + "%");
        }
        if (sortBy != null && !sortBy.isEmpty()) {
        	st.setString(index++, "%" + sortBy + "%");
        }
        
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

        // 商品リストを返す
        return list;
    }
    
    // 商品IDごとの商品一覧取得
    public Menu find(String menu_id) throws Exception {
        
        // データベース接続
        Connection con = getConnection();
        // SQL文
        PreparedStatement st = con.prepareStatement(
            "select * from menu where menu_id = ?"
        );
        // プレースホルダに値をセット
        st.setString(1, menu_id);

        // SQL実行
        ResultSet rs = st.executeQuery();

        // データの入っていない状態
        Menu m = null;

        // 検索結果が1件あるか確認しデータベースの値を1個ずつ入れる、
        if (rs.next()) {
        	// オブジェクト作成
            m = new Menu();

            m.setMenu_id(rs.getString("menu_id"));
            m.setMenu_name(rs.getString("menu_name"));
            m.setPrice(rs.getInt("price"));
            m.setGenre(rs.getString("genre"));
            m.setServe(rs.getBoolean("serve"));
        }

        // SQL終了
        rs.close();
        st.close();
        con.close();

        // 商品情報を返却
        return m;
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
    
    // 商品情報変更・更新
    public int update(Menu menu) throws Exception {

        // DB接続
        Connection con = getConnection();

        // UPDATE文
        PreparedStatement st = con.prepareStatement(
            "update menu set menu_name = ?, price = ?, serve = ? where menu_id = ?"
        );
        
        // 商品名
        st.setString(1, menu.getMenu_name());
        // 値段
        st.setInt(2, menu.getPrice());
        // 提供フラグ
        st.setBoolean(3, menu.getServe());
        // 商品ID
        st.setString(4, menu.getMenu_id());
        
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
    
    // ジャンル一覧取得
    public List<String> getGenre() throws Exception {
        // 商品情報を保存するリスト
        List<String> genres = new ArrayList<>();
    	
    	// DB接続を取得
    	Connection con = getConnection();
    	
    	// SQLを準備
    	PreparedStatement st = con.prepareStatement(
    		"select distinct genre from menu"
    	);
    	
        // SQL実行
        ResultSet rs = st.executeQuery();
        // 検索結果を1行ずつ取り出す
        while (rs.next()) {
            // リストに追加
            genres.add(rs.getString("genre"));
        }
        
        // リソースを解放（必ず閉じる）
        rs.close();
        st.close();
        con.close();
        
        return genres;
    }
}