package com.pda.until;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.pda.model.Login;


public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String date=sdf.format(new Date());
		System.out.println(date);
		System.out.println(UUID.randomUUID().toString());
		String file="111.jpg";
		String filename=file.substring(file.lastIndexOf("."));
		System.out.println(filename);
		
		System.out.println((int)(Math.random()*1000000));
		 String smtp = "smtp.qq.com";  
	        String from = "1039273497@qq.com";  
	        String to = "1039273497@qq.com";  
	        String copyto = "抄送人";  
	        String subject = "邮件主题";  
	        String content = "邮件内容";  
	        String username="1039273497@qq.com";  
	        String password="2351284866zhy";   
	        Mail.sendAndCc(smtp, from, to, copyto, subject, content, username, password);  
	}

}
