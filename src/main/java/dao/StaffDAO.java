package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Staff;


public class StaffDAO extends DAO {
	// ログイン用
    public Staff search(String staff_id, String password) throws Exception {

        // 戻り値用（最初は見つかっていないのでnull）
        Staff teacher = null;

        // DB接続を取得
        Connection con = getConnection();

        // SQLを準備（?で値を後からセットする＝SQLインジェクション対策）
        PreparedStatement st = con.prepareStatement(
            "select * from staff where staff_id = ? and password = ?"
        );

        // 1つ目の?にログイン名をセット
        st.setString(1, staff_id);

        // 2つ目の?にパスワードをセット
        st.setString(2, password);

        // SQLを実行（SELECTなのでexecuteQuery）
        ResultSet rs = st.executeQuery();

        // 検索結果を1件ずつ取り出す
        if (rs.next()) {

            // データが見つかったらCustomerオブジェクトを作成
            teacher = new Staff();

            // カラム名を指定して値を取得 → Beanにセット
            teacher.setStaff_id(rs.getString("staff_id"));
            teacher.setPassword(rs.getString("password"));
            teacher.setStaff_name(rs.getString("staff_name"));
        }
        
        
        // リソースを解放（必ず閉じる）
        rs.close();
        st.close();
        con.close();

        // 見つかればCustomer、なければnullを返す
        return teacher;
    }
    
    // 新規登録用
    public int insert(Staff staff) throws Exception {

        // DB接続を取得
        Connection con = getConnection();

        // SQLを準備（?で値を後からセットする＝SQLインジェクション対策）
        PreparedStatement st = con.prepareStatement(
            "insert into staff (staff_id, staff_name, password) values(?, ?, ?)"
        );

        // 1つ目の?にログイン名をセット
        st.setString(1, staff.getStaff_id());
        
        // 2つ目の?に名前をセット
        st.setString(2, staff.getStaff_name());


        // 3つ目の?にパスワードをセット
        st.setString(3, staff.getPassword());

        // SQLを実行
        int line = st.executeUpdate();

        // リソースを解放（必ず閉じる）
        st.close();
        con.close();


        return line;
    }
    
    // 重複確認用
    public boolean isExist(String staff_id) throws Exception {
    	
    	// DB接続を取得
        Connection con = getConnection();
        
        // SQLを準備
        PreparedStatement st = con.prepareStatement(
            "select * from staff where staff_id = ?"
        );

        // 1つ目の?にログイン名をセット
        st.setString(1, staff_id);

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
