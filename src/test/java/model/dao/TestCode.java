package model.dao;

import org.apache.commons.codec.digest.DigestUtils;

public class TestCode {

	public static void main(String[] args) {
//		for(int i=0;i<10;i++) {
//		int codex = (int)(Math.random()*100000000);
//		System.out.println(codex);
//		String codez = Integer.toString(codex);
//		String code = DigestUtils.sha1Hex(codez);
//		System.out.println("code :"+code);}
		String regex = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
		String p = "!@#asASD123";
		System.out.println("length:"+p.length());
		System.out.println(p.matches(regex));
	}

}
