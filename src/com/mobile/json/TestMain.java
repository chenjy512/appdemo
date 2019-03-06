package com.mobile.json;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class TestMain {
	
	public static void main(String[] args) {
		List list = new ArrayList();
		for (int i = 0; i < 10; i++) {
			Student student = new Student(1L+i,"zhangsan=="+i,18L+i,i+"zhangsan@163.com");
			list.add(student);
		}
//		JSONObject fromObject = JSONObject.fromObject(student);
//		String string = fromObject.toString();
//		System.out.println(string);
		JSONArray fromObject = JSONArray.fromObject(list);
		String string = fromObject.toString();
		System.out.println(string);
	}
}
