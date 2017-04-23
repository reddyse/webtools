package com.neu.myapp.fbsocial;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class FBConnection {
	public static final String FB_APP_ID = "1524813154490050";
	public static final String FB_APP_SECRET = "fb5e721f0f58b5c6c95b8e4a53c2006a";
	public static final String REDIRECT_URI = "http://localhost:8080/myapp/fbhome";
	public static final String LOGGED_OUT_URI = "http://localhost:8080/myapp/";

	static String accessToken = "";

	public String getFBAuthUrl() {
		String fbLoginUrl = "";
		try {
			fbLoginUrl = "http://www.facebook.com/dialog/oauth?" + "client_id=" + FBConnection.FB_APP_ID
					+ "&redirect_uri=" + URLEncoder.encode(FBConnection.REDIRECT_URI, "UTF-8") + "&scope=email";
			System.out.println(fbLoginUrl);
		} 
		catch (UnsupportedEncodingException e) 
		{
			System.out.println("1");
			e.printStackTrace();
		}
		return fbLoginUrl;
	}

	public String getLogOutURL(String accessToken ) {
		String url="";
		try {
			url = "https://www.facebook.com/logout.php?next="
					+ URLEncoder.encode(FBConnection.REDIRECT_URI, "UTF-8") + "&access_token="+accessToken;
			
		} catch (UnsupportedEncodingException e) {
			System.out.println("3");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}

	public String getFBGraphUrl(String code) {
		String fbGraphUrl = "";
		try {
			fbGraphUrl = "https://graph.facebook.com/oauth/access_token?" + "client_id=" + FBConnection.FB_APP_ID
					+ "&redirect_uri=" + URLEncoder.encode(FBConnection.REDIRECT_URI, "UTF-8") + "&client_secret="
					+ FB_APP_SECRET + "&code=" + code;

			System.out.println(fbGraphUrl);
		} catch (UnsupportedEncodingException e) {
			System.out.println("4");
			e.printStackTrace();
		}
		return fbGraphUrl;
	}

	public String getAccessToken(String code) {
		if ("".equals(accessToken)) 
		{
			URL fbGraphURL;
			try 
			{
				fbGraphURL = new URL(getFBGraphUrl(code));
			} 
			catch (MalformedURLException e) 
			{
				e.printStackTrace();
				throw new RuntimeException("Invalid code received " + e.getMessage());
			}
			catch (Exception e)
			{
				throw new RuntimeException("Exception Message " + e.getMessage());
			}
			
			URLConnection fbConnection;
			StringBuffer b = null;
			try {
				fbConnection = fbGraphURL.openConnection();
				BufferedReader in;
				in = new BufferedReader(new InputStreamReader(fbConnection.getInputStream()));
				String inputLine;
				b = new StringBuffer();
				while ((inputLine = in.readLine()) != null)
					b.append(inputLine + "\n");
				in.close();
			} catch (IOException e) 
			{
				System.out.println("5");
				e.printStackTrace();
				throw new RuntimeException("Unable to connect with Facebook Praneeth" + e);
			}
			catch (Exception e)
			{
				throw new RuntimeException("Exception Message " + e.getMessage());
			}
			

			accessToken = b.toString();
			if (accessToken.startsWith("{")) {
				throw new RuntimeException("Bracket CheckERROR: Access Token Invalid: " + accessToken);
			}
		}
		return accessToken;
	}
}
