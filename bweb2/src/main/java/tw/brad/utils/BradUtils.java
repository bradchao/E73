package tw.brad.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.HashMap;
import java.util.LinkedList;

import org.json.JSONArray;
import org.json.JSONObject;

public class BradUtils {
	public static String loadView(String view) throws Exception {
		String viewFolder = 
			"C:\\Users\\Brad\\git\\repository2\\bweb2\\src\\main\\webapp\\views\\";
		File viewFile = new File(viewFolder + view + ".html");
		BufferedReader reader = new BufferedReader(new FileReader(viewFile));
		String line; StringBuffer sb = new StringBuffer();
		while ( (line = reader.readLine()) != null) {
			sb.append(line + "\n");
		}
		reader.close();
		
		return sb.toString();
	}
	public static String calc(String x, String y, String op) {
		try {
			int intX = Integer.parseInt(x);
			int intY = Integer.parseInt(y);
			StringBuffer sb = new StringBuffer();
			switch (op) {
				case "0": sb.append((intX + intY)); break;
				case "1": sb.append((intX - intY)); break;
				case "2": sb.append((intX * intY)); break;
				case "3": sb.append((intX / intY))
							.append("...")
							.append((intX % intY)); break;
			}
			return sb.toString();
		}catch(Exception e) {
			return "";
		}
	}
	
	public static String createScore() {
		return "" + (int)(Math.random()*101);
	}
	
	public static int nextPage(String page, String pages) {
		int intPage = Integer.parseInt(page);
		int intPages = (int)Double.parseDouble(pages);
		if (intPage < intPages) intPage++;
		return intPage;
	}
	
	public static LinkedList<HashMap<String, String>> parseGift(String json) {
		LinkedList<HashMap<String, String>> data = new LinkedList<>();
		
		JSONArray root = new JSONArray(json);
		for (int i = 0; i< root.length(); i++) {
			JSONObject gift = root.getJSONObject(i);
			HashMap<String, String> row = new HashMap<>();
			row.put("name", gift.getString("Name"));
			row.put("tel",  gift.getString("ContactTel"));
			row.put("city",  gift.getString("County"));
			row.put("town",  gift.getString("Township"));
			data.add(row);
		}
		
		
		return data;
	}
	
	
}
