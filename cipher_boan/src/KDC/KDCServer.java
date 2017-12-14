package KDC;

import AES256.*;
import java.net.*;
import java.io.*;

public class KDCServer {

    // ID 생성
    static String ClinetAId = "10001";
    static String ClinetBId = "10002";

    // A Client , B Server Key 생성
    static String Akey = "IamaclinetA!!!!!";
    static String Bkey = "iambclinetb!!!!!";


    // A key 를 가지고 평문 B_Id + publicKey -> A 암호화 티켓 생성
    // B key 를 가지고 평문 A_Id + publicKey -> B 암호화 티켓 생성

    public static String anhohwa(String key, String id) throws Exception
    {

        // 공유키 생성
        String publickey = "Iampublickey!!!!";

        String merge = id + publickey ;

        // 암호화 생성부분
        AES256Util aes256 = new AES256Util(key);

        String encText = aes256.aseEncode(merge);


        // 티켓 전송
        return encText;
    }

    public static void main(String[] args) {

        try{
            ServerSocket serverSocket = new ServerSocket(10000);
            System.out.println("접속을 기다립니다....");

            Socket sock = serverSocket.accept();
            InetAddress inetAddr = sock.getInetAddress();
            System.out.println(inetAddr.getHostAddress() + " 로 부터 접속했습니다.");

            OutputStream out = sock.getOutputStream();
            PrintWriter pw = new PrintWriter(new OutputStreamWriter(out));

            InputStream in = sock.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(in));

            String line = null;
            while((line = br.readLine()) != null){
                //System.out.println("클라이언트로 부터 전송받은 문자열 : "+line);

                //System.out.println(line.length());

                if(line.equals("요청"))
                {

                    //System.out.println(line);
                    String ATicket = anhohwa(Akey, ClinetBId);
                    String BTicket = anhohwa(Bkey, ClinetAId);

                    System.out.println("ATciket 암호화문 : " + ATicket);
                    System.out.println("BTicket 암호화문 : " + BTicket);

                    pw.println("A");
                    pw.flush();

                    pw.println(Akey);
                    pw.flush();

                    //System.out.println(Akey);

                    pw.println(Bkey);
                    pw.flush();

                    //System.out.println(Bkey);

                    pw.println(ATicket);
                    pw.flush();

                    pw.println(BTicket);
                    pw.flush();

                }
            }
            pw.close();
            br.close();
            sock.close();
        }catch (Exception e) {
            System.out.println(e);
        }
    }


}
