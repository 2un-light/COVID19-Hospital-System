package PatientDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import ch5.jdbcDo;

public class patientDao {
	// MySQL DB 연동 시작 !!
		String id = "root";
		String pass = "111111";
		//jdbc:mysql://localhost:3306/DB이름
		String url = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf-8";
		
		Connection con = null; //DB연결
		PreparedStatement pstmt = null; //SQL 문 구성
		ResultSet rs = null; //SQL문 실행 결과 처리
		
		public void connect_cp(){
			
			//컨텍스트 객체 생성
			try {
				Context initctx = new InitialContext();
				
				//context.xml 기반의 환경설정 객체 접근 객체변수 설정
				Context envctx = (Context) initctx.lookup("java:/comp/env");
				
				//커넥션 풀에 접근
				DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
				
				//db연결
				con = ds.getConnection();
				
				System.out.println("커넥션 풀을 이용하여 데이터베이스 연결 성공!!");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

		//데이터베이스 연결
		public void connect() {
			//드라이버 로드
			try {
				Class.forName("com.mysql.jdbc.Driver");
				//DB연결
				con = DriverManager.getConnection(url, id, pass);
				
				System.out.println("MySQL 연결 성공!!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		
		//데이터베이스 연결 해제
		public void disConnect(){
			if( con != null ){
				try{
					con.close();
				}catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(pstmt != null ){
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		public void InsertPatient(patientDo aDo){
			//1. DB연결
			//connect();
			connect_cp();
			
			//2. SQL 처리
			//SQL문 구성
			String sql = "insert into patients (name, gender, date, temper, symptom, rule, note)"
					+ " values(?,?,?,?,?,?,?)";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, aDo.getName());
				pstmt.setString(2, aDo.getGender());
				pstmt.setString(3, aDo.getDate());
				pstmt.setString(4, aDo.getTemper());
				pstmt.setString(5, aDo.getSymptom());
				pstmt.setString(6, aDo.getRule());
				pstmt.setString(7, aDo.getNote());
				
				//SQL 실행
				pstmt.executeUpdate();
				System.out.println(" InsertPatient 데이터베이스 처리 완료 !!");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//3. DB 연결 해제
			disConnect();
		}
		
		public ArrayList<patientDo> getAllPatient(){
			
			//1. DB연결
//			connect();
			connect_cp();
			
			//2. SQL문 처리
			ArrayList<patientDo> aList = new ArrayList<patientDo>();
			String sql = "select * from patients";
			try {
				pstmt = con.prepareStatement(sql);
			
			//3. 실행
			rs = pstmt.executeQuery(); //SQL 처리결과 rs에 리턴
			while(rs.next()){
				patientDo aDo = new patientDo();
				aDo.setNum(rs.getInt(1)); //num
				aDo.setName(rs.getString(2)); //name
				aDo.setGender(rs.getString(3)); //gender
				aDo.setDate(rs.getString(4)); //date
				aDo.setTemper(rs.getString(5)); //temper
				aDo.setSymptom(rs.getString(6)); //symptom
				aDo.setRule(rs.getString(7)); //rule
				aDo.setNote(rs.getString(8)); //note
				
				aList.add(aDo);
			}
			System.out.println("getAllPatient() 처리 완료!!");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			//4. DB 연결 해제
			disConnect();
			
			return aList;
		}
		
		public patientDo getPatientOne(int num){
			System.out.println("getPatientOne() 처리시작!!");
			connect_cp();
			
			patientDo aDo = new patientDo();
			
			try {
				String sql = "select * from patients where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					aDo.setNum(rs.getInt(1)); //num
					aDo.setName(rs.getString(2)); //name
					aDo.setGender(rs.getString(3)); //gender
					aDo.setDate(rs.getString(4)); //date
					aDo.setTemper(rs.getString(5)); //temper
					aDo.setSymptom(rs.getString(6)); //symptom
					aDo.setRule(rs.getString(7)); //rule
					aDo.setNote(rs.getString(8)); //note
				}
				
				disConnect();
				System.out.println("getPatientOne() 처리완료!!");
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return aDo;
		}
		
		
		public void modifyPatient(patientDo aDo){
			System.out.println("modifyPatient() 처리시작 !!");
			connect_cp();
			
			try {
				String sql = "update patients set name=?, gender=?, date=?, temper=?, symptom=?, rule=?, note=? "
						+ "where num=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, aDo.getName());
				pstmt.setString(2, aDo.getGender());
				pstmt.setString(3, aDo.getDate());
				pstmt.setString(4, aDo.getTemper());
				pstmt.setString(5, aDo.getSymptom());
				pstmt.setString(6, aDo.getRule());
				pstmt.setString(7, aDo.getNote());
				pstmt.setInt(8, aDo.getNum());
				pstmt.executeUpdate();
				
				disConnect();
				System.out.println("modifyPatient() 처리완료 !!");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		
		public void deletePatient(int num) {
			System.out.println("deletePatient() 처리 시작 !!");
			connect_cp();
			
			
			try {
				String sql = "delete from patients where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				pstmt.executeUpdate();
				
				disConnect();
				System.out.println("deletePatient() 처리 완료 !!");
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		public ArrayList<patientDo> searchPatientOne(String name){
			System.out.println("searchPatientOne() 처리시작!!");
			connect_cp();
			
			//2. SQL문 처리
			ArrayList<patientDo> aList = new ArrayList<patientDo>();
			String sql = "select * from patients where name=?";
			
			try {	
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				while(rs.next()){
					patientDo aDo = new patientDo();
					aDo.setNum(rs.getInt(1)); //num
					aDo.setName(rs.getString(2)); //name
					aDo.setGender(rs.getString(3)); //gender
					aDo.setDate(rs.getString(4)); //date
					aDo.setTemper(rs.getString(5)); //temper
					aDo.setSymptom(rs.getString(6)); //symptom
					aDo.setRule(rs.getString(7)); //rule
					aDo.setNote(rs.getString(8)); //note
					
					aList.add(aDo);
				}
				
				disConnect();
				System.out.println("searchPatientOne() 처리완료!!");
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return aList;
		}
		
				
		
}

