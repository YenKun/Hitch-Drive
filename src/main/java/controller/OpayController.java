package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OpayController {
	@RequestMapping(path= {"/oPay.controller"},method= {RequestMethod.GET},produces = { "application/json" })
	@ResponseBody
	public String method(HttpServletRequest request) {
		Integer price = Integer.parseInt(request.getParameter("rideprice"));
		String desc = request.getParameter("ridedesc");
		String date = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new java.util.Date());
		Long tradeNo = (long)(Math.random()*1000000000000L);
		String defaultVal ="HashKey=5294y06JbISpM5x9&"
				+ "ChoosePayment=ALL&"
				+ "ChooseSubPayment=&"
				+ "ClientBackURL=https://developers.opay.tw/AioMock/MerchantClientBackUrl&"
				+ "EncryptType=1&"
				+ "ItemName=Hitch&Drive&"
				+ "MerchantID=2000132&"
				+ "MerchantTradeDate="
				+ date
				+ "&"
				+ "MerchantTradeNo="
				+ tradeNo
				+ "&"
				+ "PaymentType=aio&"
				+ "ReturnURL=https://developers.opay.tw/AioMock/MerchantReturnUrl&"
				+ "StoreID=&"
				+ "TotalAmount="
				+ price
				+ "&"
				+ "TradeDesc="
				+ desc
				+ "&"
				+ "HashIV=v77hoKGq4kWxNNIS";
		
		String sha ="";
		try {
			sha =getSha256(URLEncoder.encode(defaultVal, "UTF-8").toLowerCase()).toUpperCase();			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String opay = "{'price':'"
				+ price
				+ "','desc':'"
				+ desc
				+ "','date':'"
				+ date
				+ "','sha':'"
				+ sha
				+ "','tradeNo':'"
				+ tradeNo
				+ "'}";
		return opay.replaceAll("'", "\"");
	}
	
	 public static String getSha256(String value) {
		    try{
		        MessageDigest md = MessageDigest.getInstance("SHA-256");
		        md.update(value.getBytes());
		        return bytesToHex(md.digest());
		    } catch(Exception ex){
		        throw new RuntimeException(ex);
		    }
		 }
		 private static String bytesToHex(byte[] bytes) {
		    StringBuffer result = new StringBuffer();
		    for (byte b : bytes) result.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
		    return result.toString();
		 }
	
	
}
