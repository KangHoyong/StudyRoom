package SERVER_B;

import AES256.AES256Util;

import java.awt.*;
import java.net.*;
import java.io.*;
import java.util.Random;

public class Server_B {

    static String bKey;
    static int a_id;
    static String sharedKey;
    static int num;

    public static boolean isEqualNum(String encryptor) throws Exception
    {
        int compareNum = Integer.parseInt(bokhohwa_ticket(encryptor, sharedKey));
        System.out.println("복호화 결과 [난수 값] >> " + compareNum);
        if(compareNum == num) return true;
        return false;
    }

    public static String bokhohwa_ticket(String encryptor, String key) throws Exception
    {
        AES256Util aes256 = new AES256Util(key);

        return aes256.aesDecode(encryptor);

    }

    public static void main(String[] args){
        try{
            ServerSocket serverSocket = new ServerSocket(10002);
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
               // System.out.println("클라이언트로 부터 전송받은 문자열3 : "+line);

                if(line.equals("B"))
                {

                    bKey = br.readLine();
                    String bTicket = br.readLine();
                    String decryption = bokhohwa_ticket(bTicket, bKey);
                    System.out.println("A Clinet 로 부터 전달받은 Server B Ticket  >> "+ bTicket);
                    System.out.println("Server B Ticket 복호화 결과 >> "+ decryption);
                    System.out.println();
                    System.out.println("B ticket 복호화 하여  Kab 와 A 아이디 획득");
                    a_id = Integer.parseInt(decryption.substring(0,5));
                    sharedKey = decryption.substring(5,decryption.length());
                    System.out.println();
                    System.out.println("SharedKey value : " + sharedKey);
                    System.out.println("B id value : " + a_id);
                    System.out.println();
                    System.out.println("+++++ 난수 생성, 생성된 난수 A Client 전달 +++++");

                    //난수 보내기!!
                    Random random = new Random();
                    num = random.nextInt();
                    System.out.println("난수 값 생성 : " + num);
                    pw.println(num);
                    pw.flush();

                    // 난수 받음!!
                    String comnum = br.readLine();
                    System.out.println("A Client 로 부터 받은 난수 암호화 " + comnum);
                    //System.out.println();
                    if(isEqualNum(comnum)) System.out.println("같은 숫자입니다. 인증 승인 !! ");
                    else System.out.println("다른 숫자입니다. 인증 실패 !!");

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
