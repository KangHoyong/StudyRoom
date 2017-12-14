package CLIENT;

import AES256.AES256Util;

import java.net.*;
import java.io.*;

public class Client_A {

    static String Akey;
    static String Bkey;
    static String Aticket;
    static String Bticket;

    static int b_id;
    static String sharedKey;

    static boolean isReceive = true;

    public static String amhohwa(String key, String ticket) throws Exception
    {
        AES256Util aes256 = new AES256Util(key);

        String encText = aes256.aseEncode(ticket);

        return encText;
    }


    public static String bokhohwa(String key, String ticket) throws Exception
    {
        AES256Util aes256 = new AES256Util(key);


        return aes256.aesDecode(ticket);

    }


    public static void sendToBServer(PrintWriter pw, BufferedReader br){
        try {

            pw.println("B");
            pw.flush();

            pw.println(Bkey);
            pw.flush();

            pw.println(Bticket);
            pw.flush();

            //난수받기코드 짜기
            String ranEncy = amhohwa(sharedKey,br.readLine());
            pw.println(ranEncy);

            System.out.println("B Server 부터 받은 난수 암호화 수행");
            System.out.println("난수 암호문 : " + ranEncy);


        }catch (Exception e){
            System.out.println(e);
        }
    }


    public static void decoderA(PrintWriter pw, BufferedReader br)
    {
        try {

            BufferedReader keyBoard = new BufferedReader(new InputStreamReader(System.in));
            String line = null;
            System.out.print("인증서버 요청 승인 원하시면 (요청) 입력 : " );
            line = keyBoard.readLine();
            pw.println(line);
            pw.flush();


            // 인증센터에서 받음
            if(br.readLine().equals("A")) {
                Akey = br.readLine();
                Bkey = br.readLine();
                Aticket = br.readLine();
                Bticket = br.readLine();

                String decryption = bokhohwa(Akey, Aticket);

                b_id = Integer.parseInt(decryption.substring(0,5));
                sharedKey = decryption.substring(5,decryption.length());
                isReceive = false;


                // KDC 로 부터 A , B 티켓을 받음
                // A clinet 는 A 티켓을 복호화 하여 공유키와 B아이디를 획득
                // TEST
                //System.out.println("Test");
                //System.out.println("A key value : " + Akey);
                //System.out.println("B key value : " + Bkey);
                System.out.println("KDC 로 부터 A, B 티켓을 획득 ");
                System.out.println("A ticket : " + Aticket);
                System.out.println("B ticket : " +Bticket);
                System.out.println();
                System.out.println("Server A Ticket 복호화 결과 >> "+ decryption);
                System.out.println("A ticket 복호화 하여  Kab 와 B 아이디 획득");
                System.out.println("SharedKey value : " + sharedKey);
                System.out.println("B id value : " + b_id);
                System.out.println();

            }

        }catch (Exception e){
            System.out.println(e);
        }


    }

    public static void connectServer(int port)
    {
        try{
            Socket sock = new Socket("127.0.0.1", port);

            OutputStream out = sock.getOutputStream();
            InputStream in = sock.getInputStream();
            PrintWriter pw = new PrintWriter(new OutputStreamWriter(out));
            BufferedReader br = new BufferedReader(new InputStreamReader(in));

            if(isReceive) decoderA(pw,br);
            else sendToBServer(pw, br);

            pw.close();
            br.close();
            sock.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    public static void main(String[] args){

        connectServer(10000);
        connectServer(b_id);
    }
}
