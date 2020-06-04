package project;

import java.sql.*;

import work.crypt.SHA256;
import work.crypt.BCrypt;

public class LogonDBBean {

    //LogonDBBean ���� ��ü ���� <- �Ѱ��� ������ �����ؼ� ����
    private static LogonDBBean instance = new LogonDBBean();

    //LogonDBBean��ü�� �����ϴ� �޼ҵ�
    public static LogonDBBean getInstance() {
        return instance;
    }

    private LogonDBBean() {}

    private Connection getConnection() throws RuntimeException {
        Connection conn = null;
        try {

            // 1. ����̹� �ε�
            Class.forName("com.mysql.jdbc.Driver");

            // 2. �����ϱ� ("jdbc:mysql://localhost/�����db�̸�")
            String url = "jdbc:mysql://localhost:3306/project?characterEncoding=UTF-8&serverTimezone=UTC";

            // 3. ���� ���� url, id, pw
            conn = DriverManager.getConnection(url, "root", "q1w2e3r4A");
            System.out.println("db����1");
        } catch(ClassNotFoundException e) {
            System.out.println("����̹� �ε� ����");
        } catch(SQLException e) {
            System.out.println("����: " + e);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }


    public int insertMember(LogonDataBean member) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {

            System.out.printf("���� Request ���� :  %s,%s,%s,%s", member.getId(), member.getPasswd(), member.getName(), member.getTel());
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
                System.out.println("������ �Է� ����");
                return -1;
            } else {
                System.out.println("������ �Է� ����");
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
                System.out.println("�α��� ���� ����");
                System.out.printf("%s,%s,%s,%s", dbId, dbPasswd, dbName, dbTel);
                System.out.println("===============");
                return 1;
            } else {
                System.out.println("�α��� ���� ����");
                return -1;
            }

//            String orgPass = passwd;
//            String shaPass = sha.getSha256(orgPass.getBytes());
//            if(rs.next()){//�ش� ���̵� ������ ����
//                String dbpasswd= rs.getString("passwd");
//                if(BCrypt.checkpw(shaPass,dbpasswd))
//                    x= 1; //��������
//                else
//                    x= 0; //��й�ȣ Ʋ��
//            }else//�ش� ���̵� ������ ����
//                x= -1;//���̵� ����

        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return -1;
    }

    //���̵� �ߺ� Ȯ�� (confirmId.jsp)���� ���̵��� �ߺ� ���θ� Ȯ���ϴ� �޼ҵ�
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

            if(rs.next())//���̵� ����
                x= 1; //���� ���̵� ����
            else
                x= -1;//���� ���̵� ����
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return x;
    }

    //ȸ�� ���� ���� ��(modifyForm.jsp)�� ���� ���� ���� ������ �������� �޼ҵ�
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

            if (rs.next()) {//�ش� ���̵� ���� ���ڵ尡 ����
                String dbpasswd= rs.getString("passwd");
                //����ڰ� �Է��� ��й�ȣ�� ���̺��� ��й�ȣ�� ������ ����
                if(BCrypt.checkpw(shaPass,dbpasswd)){
                    member = new LogonDataBean();//����������� ��ü����
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
        return member;//������ ����� ��ü member ����
    }

}