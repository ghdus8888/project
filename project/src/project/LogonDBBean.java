package project;

import java.sql.*;

import work.crypt.SHA256;
import work.crypt.BCrypt;

public class LogonDBBean {

    //LogonDBBean 전역 객체 생성 <- 한개의 객제만 생성해서 공유
    private static LogonDBBean instance = new LogonDBBean();

    //LogonDBBean객체를 리턴하는 메소드
    public static LogonDBBean getInstance() {
        return instance;
    }

    private LogonDBBean() {}

    private Connection getConnection() throws RuntimeException {
        Connection conn = null;
        try {

            // 1. 드라이버 로딩
            Class.forName("com.mysql.jdbc.Driver");

            // 2. 연결하기 ("jdbc:mysql://localhost/사용할db이름")
            String url = "jdbc:mysql://localhost:3306/project?characterEncoding=UTF-8&serverTimezone=UTC";

            // 3. 연결 정보 url, id, pw
            conn = DriverManager.getConnection(url, "root", "q1w2e3r4A");
            System.out.println("db성공1");
        } catch(ClassNotFoundException e) {
            System.out.println("드라이버 로딩 실패");
        } catch(SQLException e) {
            System.out.println("에러: " + e);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }


    public int insertMember(LogonDataBean member) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {

            System.out.printf("가입 Request 정보 :  %s,%s,%s,%s", member.getId(), member.getPasswd(), member.getName(), member.getTel());
            System.out.println("================================");
            conn = getConnection();

            pstmt = conn.prepareStatement("insert into project.member values (?,?,?,?)");
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPasswd());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getTel());

            int count = pstmt.executeUpdate();
            System.out.println(count);
            if( count == 0 ) {
                System.out.println("데이터 입력 실패");
                return -1;
            } else {
                System.out.println("데이터 입력 성공");
                return 1;
            }

//        SHA256 sha = SHA256.getInsatnce();
//        try {
//            conn = getConnection();
//
//            String orgPass = member.getPasswd();
//            String shaPass = sha.getSha256(orgPass.getBytes());
//            String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
//
//            pstmt = conn.prepareStatement("insert into project.member values (?,?,?,?)");
//            pstmt.setString(1, member.getId());
//            pstmt.setString(2, bcPass);
//            pstmt.setString(3, member.getName());
//            pstmt.setString(4, member.getTel());
//            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return -1;
    }

    //

    public int userCheck(String id, String passwd) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select * from project.member where id = ? and passwd = ?");
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                String dbId = rs.getString("id");
                String dbPasswd = rs.getString("passwd");
                String dbName = rs.getString("name");
                String dbTel = rs.getString("tel");
                System.out.println("로그인 정보 있음");
                System.out.printf("%s,%s,%s,%s", dbId, dbPasswd, dbName, dbTel);
                System.out.println("===============");
                return 1;
            } else {
                System.out.println("로그인 정보 없음");
                return -1;
            }

//            String orgPass = passwd;
//            String shaPass = sha.getSha256(orgPass.getBytes());
//            if(rs.next()){//해당 아이디가 있으면 수행
//                String dbpasswd= rs.getString("passwd");
//                if(BCrypt.checkpw(shaPass,dbpasswd))
//                    x= 1; //인증성공
//                else
//                    x= 0; //비밀번호 틀림
//            }else//해당 아이디 없으면 수행
//                x= -1;//아이디 없음

        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return -1;
    }

    //아이디 중복 확인 (confirmId.jsp)에서 아이디의 중복 여부를 확인하는 메소드
    public int confirmId(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        int x=-1;

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
                    "select id from member where id = ?");
            pstmt.setString(1, id);
            rs= pstmt.executeQuery();

            if(rs.next())//아이디 존재
                x= 1; //같은 아이디 있음
            else
                x= -1;//같은 아이디 없음
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return x;
    }

    //회원 정보 수정 폼(modifyForm.jsp)을 위한 기존 가입 정보를 가져오는 메소드
    public LogonDataBean getMember(String id, String passwd){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        LogonDataBean member=null;

        SHA256 sha = SHA256.getInsatnce();
        try {
            conn = getConnection();

            String orgPass = passwd;
            String shaPass = sha.getSha256(orgPass.getBytes());

            pstmt = conn.prepareStatement(
                    "select * from member where id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {//해당 아이디에 대한 레코드가 존재
                String dbpasswd= rs.getString("passwd");
                //사용자가 입력한 비밀번호와 테이블의 비밀번호가 같으면 수행
                if(BCrypt.checkpw(shaPass,dbpasswd)){
                    member = new LogonDataBean();//데이터저장빈 객체생성
                    member.setId(rs.getString("id"));
                    member.setName(rs.getString("name"));
                    member.setTel(rs.getString("tel"));
                }
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return member;//데이터 저장빈 객체 member 리턴
    }

}