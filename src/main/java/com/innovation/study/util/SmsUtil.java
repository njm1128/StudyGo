package com.innovation.study.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Random;

public class SmsUtil {

	public static void sendSMS(String content, String mem_hp, String nointeractiveVal) throws Exception {
		String charsetType = "UTF-8"; // EUC-KR 또는 UTF-8
		String sms_url = "";
		sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
		String user_id = "wigjainno"; // SMS아이디
		String secure = "f02329e8dc6adea33bda4230b2765b5e";// 인증키
		String msg = content;
		String rphone = mem_hp;
		String sphone1 = "010"; // 보내는사람 번호1
		String sphone2 = "5731"; // 보내는사람 번호2
		String sphone3 = "6379"; // 보내는사람 번호3
		String mode = "1";
		String subject = "";
		String nointeractive = nullcheck(nointeractiveVal, "");

		String[] host_info = sms_url.split("/");
		String host = host_info[2];
		String path = "/" + host_info[3];
		int port = 80;

		// 데이터 맵핑 변수 정의
		String arrKey[] = new String[] { "user_id", "secure", "msg", "rphone", "sphone1", "sphone2", "sphone3", "mode",
				"subject" };
		String valKey[] = new String[arrKey.length];
		valKey[0] = user_id;
		valKey[1] = secure;
		valKey[2] = msg;
		valKey[3] = rphone;
		valKey[4] = sphone1;
		valKey[5] = sphone2;
		valKey[6] = sphone3;
		valKey[7] = mode;
		valKey[8] = subject;

		String boundary = "";
		Random rnd = new Random();
		String rndKey = Integer.toString(rnd.nextInt(32000));
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] bytData = rndKey.getBytes();
		md.update(bytData);
		byte[] digest = md.digest();
		for (int i = 0; i < digest.length; i++) {
			boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
		}
		boundary = "---------------------" + boundary.substring(0, 11);

		// 본문 생성
		String data = "";
		String index = "";
		String value = "";
		for (int i = 0; i < arrKey.length; i++) {
			index = arrKey[i];
			value = valKey[i];
			data += "--" + boundary + "\r\n";
			data += "Content-Disposition: form-data; name=\"" + index + "\"\r\n";
			data += "\r\n" + value + "\r\n";
			data += "--" + boundary + "\r\n";
		}

		InetAddress addr = InetAddress.getByName(host);
		Socket socket = new Socket(host, port);
		// 헤더 전송
		BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
		wr.write("POST " + path + " HTTP/1.0\r\n");
		wr.write("Content-Length: " + data.length() + "\r\n");
		wr.write("Content-type: multipart/form-data, boundary=" + boundary + "\r\n");
		wr.write("\r\n");

		// 데이터 전송
		wr.write(data);
		wr.flush();

		// 결과값 얻기
		BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(), charsetType));
		String line;
		String alert = "";
		ArrayList tmpArr = new ArrayList();
		while ((line = rd.readLine()) != null) {
			tmpArr.add(line);
		}
		wr.close();
		rd.close();

		String tmpMsg = (String) tmpArr.get(tmpArr.size() - 1);
		String[] rMsg = tmpMsg.split(",");
		String Result = rMsg[0]; // 발송결과

		System.out.println("Result : " + Result);

	}

	public static String nullcheck(String str, String Defaultvalue) throws Exception {
		String ReturnDefault = "";
		if (str == null) {
			ReturnDefault = Defaultvalue;
		} else if (str == "") {
			ReturnDefault = Defaultvalue;
		} else {
			ReturnDefault = str;
		}
		return ReturnDefault;
	}
}
