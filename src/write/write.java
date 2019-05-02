package write;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

public class write {
	private Connection conn;
	public write(){
		try{
			String dburl = "jdbc:mysql://192.168.43.18:3306/db_hw";
			String dbid = "kw";
			String dbpassword = "vkdvkd2";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dburl,dbid,dbpassword);
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	public int upload(String title, String memo, String id){
		String SQL = "INSERT INTO `db_hw`.`free_board` VALUES (?,?,?,?,?)";
		GregorianCalendar today = new GregorianCalendar();	
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String str = dayTime.format(today.getTime());
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL.toString());
			pstmt.setString(1, title);
			pstmt.setString(2, id);
			pstmt.setString(3, str);
			pstmt.setInt(4, 0);
			pstmt.setString(5, memo);
			pstmt.execute();
			pstmt.close();
			conn.close();
			
			return pstmt.executeUpdate();
		}catch (Exception e){
			e.printStackTrace();
		}
		return -1;
	}
}
