package project;
import java.io.*;
import java.util.*;
import javax.servlet.http.*;
import java.sql.Date;

public class SessionChecker{
        private String ip="";
        public void setSession(HttpSession session, String ip){
 // 由ъ뒪�꼫 媛앹껜瑜� �깮�꽦�빐�꽌 �씠寃껊룄 �꽭�뀡�뿉 媛숈씠 �떞�뒗�떎.  由ъ뒪�꼫 �씪�뒗 �씠由꾩쑝濡�...
                this.ip = ip;
        session.setAttribute("listener", new CustomBindingListener(ip));
                
    }
}
//                                                     �뿬湲곗꽌    援ы쁽�뻽�뒿�땲�떎..

class CustomBindingListener implements HttpSessionBindingListener {
        String num=null;
        String ip = "";
        String read_ip = null;//�쁽�옱 �젒�냽�옄 �븘�씠�뵾

        public CustomBindingListener(String ip){
                this.ip=ip;
        }
        public void valueBound(HttpSessionBindingEvent event) {
        // �꽭�뀡�씠 �깮寃쇱쓣 �븣 �븷 �궡�슜
        
        long t = System.currentTimeMillis();
        Date date = new Date(t);
        String chdate = date.toString();
        chdate = chdate.replace('-','/');
        String today_count=null;
    String today = null;
    String today_num = null;//�삤�뒛 諛⑸Ц�옄 移댁슫�듃
        String total_num = null;//珥� 移댁슫�듃
        
        Vector v = new Vector();//�쁽�옱 �젒�냽�옄 �븘�씠�뵾 泥댄겕
          try{
                      //  String dir = System.getProperty("user.dir")+"/ApacheGroup/ePims/admin/";//移댁슫�듃 �뙆�씪�뱾�쓣 ���옣 �븯�뒗 寃쎈줈 �꽕�젙(�젅��寃쎈줈)
        	//  String dir = "\Users\User\Desktop\�깉 �뤃�뜑";
        	  String dir = SessionChecker.class.getResource("").getPath();
                        String filename = dir+"count.txt";
                        String filename2 = dir+"ip_count.txt";
                        String filename3 = dir+"today_count.txt";
                        File file = new File(filename);
                        File file2 = new File(filename2);
                        File file3 = new File(filename3);
                        if(!file.exists()){
                                file.createNewFile();
                        }
                        if(!file2.exists()){
                                file2.createNewFile();
                        }
                        if(!file3.exists()){
                                file3.createNewFile();
                        }
                        FileReader fr = new FileReader(filename);
                        BufferedReader br = new BufferedReader(fr);
                        FileReader fr2 = new FileReader(filename2);
                        BufferedReader br2 = new BufferedReader(fr2);
                        FileReader fr3 = new FileReader(filename3);
                        BufferedReader br3 = new BufferedReader(fr3);
                
                        num = br.readLine();//珥� 移댁슫�듃 媛� �씫�뼱�삤湲�
                        while((read_ip= br2.readLine())!=null){
                                read_ip = read_ip.trim();
                                v.addElement(read_ip);
                        }//�쁽�옱 �젒�냽�옄 �븘�씠�뵾 媛��졇�삤湲�
                        today_count = br3.readLine();//�삤�뒛 諛⑸Ц�옄 移댁슫�듃 媛��졇�삤湲�
                        br.close();
                        br2.close();
                        br3.close();
                        //珥앸갑臾몄옄 珥덇린�솕
                        if(num==null){
                                FileWriter fw = new FileWriter(filename);
                                fw.write("0");
                                num="0";
                                fw.close();
                        }
                        //�쁽�옱�젒�냽�옄 珥덇린�솕
                        if(read_ip==null){
                                String start = "127.0.0.1";
                                FileWriter fw = new FileWriter(filename2);
                                BufferedWriter bw = new BufferedWriter(fw);
                                bw.write(start,0,start.length());
                                bw.close();
                                fw.close();
                        }
                        //�삤�뒛 諛⑸Ц�옄 珥덇린�솕
                        if(today_count==null){
                                FileWriter fw3 = new FileWriter(filename3);
                                fw3.write(chdate+",1");
                                today_num="0";
                                fw3.close();
                        }
                        
                        //珥� 移댁슫�듃 �엯�젰
                        int now = (Integer.parseInt(num))+1;
                        Integer new_num = new Integer(now);
                        num = new_num.toString();
                        FileWriter fw = new FileWriter(filename);
                        fw.write(num);
                        fw.close();
                        
                        //�쁽�옱 �젒�냽�옄 �븘�씠�뵾 �엯�젰
                        FileWriter fw2 = new FileWriter(filename2);
                        BufferedWriter bw2 = new BufferedWriter(fw2);
                        boolean match=false;
                        for (int i=0; i<v.size(); i++)
                        {
                                String read = (String)v.elementAt(i);
                                if(read.equals(ip)){
                                        v.setElementAt(ip,i);//�븘�씠�뵾 媛숈�吏� 鍮꾧탳 �썑 �뾽�뜲�씠�듃
                                        match = true;
                                }

                        }
                        if(!match){
                                v.addElement(ip);
                        }
                        for(int j=0; j<v.size(); j++){
                                String wr = (String)v.elementAt(j);
                                if(j!=0)
                                bw2.newLine();
                                bw2.write(wr,0,wr.length());
                        }
                        bw2.close();
                        fw2.close();

                        //�삤�뒛 諛⑸Ц�옄 �엯�젰
                        if(today_count!=null){
                                String[] today_Cnvt = new String[3];
                                int idx = 0;
                                StringTokenizer strToken = new StringTokenizer(today_count, ",", true);
                                while(strToken.hasMoreTokens()) {
                                                        today = strToken.nextToken();
                                                        today_Cnvt[idx] = today;
                                                        idx++;
                                }
                                
                                if(today_Cnvt[0].equals(chdate)){
                                        int today_num2 = (Integer.parseInt(today_Cnvt[2]))+1;
                                        
                                        Integer new_today = new Integer(today_num2);
                                        today_num = new_today.toString();

                                        FileWriter fw3 = new FileWriter(filename3);
                                        fw3.write(chdate+","+today_num);
                                        fw3.close();
                                }else{
                                        today_num = "1";
                                        FileWriter fw3 = new FileWriter(filename3);
                                        fw3.write(chdate+","+today_num);
                                        fw3.close();
                                }
                        }
                }catch(Exception e){System.out.println(e.getMessage());}        
        }
                

    public void valueUnbound(HttpSessionBindingEvent event) {
 // �꽭�뀡�씠 醫낅즺�릺�뿀�쓣 �븣
          Vector v = new Vector();
          try{
        	  String dir = SessionChecker.class.getResource("").getPath();
                        String filename = dir+"ip_count.txt";

                        FileReader fr = new FileReader(filename);
                        BufferedReader br = new BufferedReader(fr);

                        while((read_ip= br.readLine())!=null){
                                read_ip = read_ip.trim();
                                v.addElement(read_ip);
                        }
                        br.close();

                        FileWriter fw = new FileWriter(filename);
                        BufferedWriter bw = new BufferedWriter(fw);
                        for (int i=0; i<v.size(); i++)
                        {
                                String read = (String)v.elementAt(i);
                                if(read.equals(ip)){
                                        v.removeElementAt(i);
                                }
                        }
                        
                        for(int j=0; j<v.size(); j++){
                                String wr = (String)v.elementAt(j);
                                if(j!=0)
                                bw.newLine();
                                bw.write(wr,0,wr.length());
                        }
                        bw.close();
                        fw.close();
                }catch(Exception e){System.out.println(e.getMessage());}
        }
}