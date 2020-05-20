package jwgl.DAO;

import java.util.ArrayList;
import java.sql.*;

import jwgl.Entities.LessonTime;
import jwgl.Entities.Score;
import jwgl.Entities.Timetable;

public class TheDAO {
    public static String login(String stuID, String password) {
        String classID = null;
        
        Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM stuInfo WHERE stuID=? and password=?";
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,  stuID);
			stmt.setString(2,  password);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				classID = rs.getString("classID");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        return classID;
    }

    public static ArrayList<Timetable> queryTimetableStudent(String stuID, int term) {
        ArrayList<Timetable> timetables = null;
        
        Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM Timetable WHERE term=? and "
					+ "classID=(select classID from stuInfo where stuID=?)";
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1,  term);
			stmt.setString(2,  stuID);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				timetables = new ArrayList<Timetable>();
				rs.previous();
			}
			
			while(rs.next()) {
				Timetable tt = new Timetable();
				
				tt.setCode(rs.getString("code"));
				tt.setName(rs.getString("name"));
				tt.setCredit(rs.getFloat("credit"));
				tt.setLessonID(rs.getString("lessonID"));
				tt.setClassID(rs.getString("classID"));
				tt.setTeacher(rs.getString("teacher"));
				tt.setTime(queryLessonTime(rs.getString("lessonID")));
				
				timetables.add(tt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        return timetables;
    }

    public static ArrayList<Timetable> queryTimetableClass(String classID, int term) {
        ArrayList<Timetable> timetables = null;
        
        Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM Timetable WHERE classID=?";
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,  classID);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				timetables = new ArrayList<Timetable>();
				rs.previous();
			}
			
			while(rs.next()) {
				Timetable lt = new Timetable();
				
				lt.setCode(rs.getString("code"));
				lt.setName(rs.getString("name"));
				lt.setCredit(rs.getFloat("credit"));
				lt.setLessonID(rs.getString("lessonID"));
				lt.setClassID(rs.getString("classID"));
				lt.setTeacher(rs.getString("teacher"));
				
				timetables.add(lt);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
        return timetables;
    }

    public static ArrayList<Score> queryScore(String stuID, int term) {
        ArrayList<Score> scores = null;
        
        Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM Score WHERE stuID=?";
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,  stuID);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				scores = new ArrayList<Score>();
				rs.previous();
			}
			
			while(rs.next()) {
				Score lt = new Score();
				
				lt.setCode(rs.getString("code"));
				lt.setLessonID(rs.getString("lessonID"));
				lt.setName(rs.getString("name"));
				lt.setType(rs.getString("type"));
				lt.setCredit(rs.getFloat("credit"));
				lt.setRegular(rs.getInt("regular"));
				lt.setFinalExam(rs.getInt("finalExam"));			
				lt.setTotal(rs.getInt("total"));
				lt.setGP(rs.getFloat("GP"));
				
				scores.add(lt);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
        return scores;
    }
    
    /*以下是私有方法*/
    /*从LessonTime表中查询课程信息*/
    private static ArrayList<LessonTime> queryLessonTime(String lessonID) {
    	ArrayList<LessonTime> lessonTimes = null;
    	
    	Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM LessonTime WHERE lessonID=?";
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,  lessonID);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				lessonTimes = new ArrayList<LessonTime>();
				rs.previous();
			}
			
			while(rs.next()) {
				LessonTime lt = new LessonTime();
				
				lt.setPlace(rs.getString("place"));
				lt.setWeekday(rs.getInt("weekday"));
				lt.setStartTime(rs.getInt("startTime"));
				lt.setEndTime(rs.getInt("endTime"));
				
				lessonTimes.add(lt);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return lessonTimes;
    }
    
    /*以下是连接池*/
    private static String DRIVERCLASS = "com.mysql.cj.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost:3306/jwgl?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "123456";
	
	//加载驱动
	private static void loadDriver() {
		try {
			Class.forName(DRIVERCLASS);
		} catch(ClassNotFoundException e) {
			System.out.println("鍔犺浇椹卞姩澶辫触");
			e.printStackTrace();
		}
	}
	
	//连接数据库
	public static Connection getConnection() throws Exception {
		loadDriver();
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}
	
	//释放空间
	public static void release(ResultSet rs, Statement stmt, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		release(stmt, conn);
	}
	
	public static void release(Statement stmt, Connection conn) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			stmt = null;
		}
		
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn = null;
		}
	}
}