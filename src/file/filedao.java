package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

public class filedao {
	private Connection conn;
	public filedao(){
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
	
	public int upload(String title, String memo, String file1, String file2, String file3, String file4, String file5, String file){
		String SQL = "INSERT INTO `db_hw`.`course material` VALUES (?,?,?,?,?,?,?,?,?,?)";
		GregorianCalendar today = new GregorianCalendar();	
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String str = dayTime.format(today.getTime());
		int f = Integer.parseInt(file);
		System.out.println(f);
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL.toString());
			pstmt.setString(1, title);
			pstmt.setString(2, str);
			pstmt.setInt(3, 0);
			pstmt.setInt(4, f);
			pstmt.setString(5, memo);
			pstmt.setString(6, file1);
			pstmt.setString(7, file2);
			pstmt.setString(8, file3);
			pstmt.setString(9, file4);
			pstmt.setString(10, file5);
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
