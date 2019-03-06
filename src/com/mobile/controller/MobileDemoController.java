package com.mobile.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.HttpServletBean;

import com.mobile.entity.DataDto;

@Controller
@RequestMapping(value="/hello")
public class MobileDemoController {

	   
	@RequestMapping(value="/world.do",method=RequestMethod.GET)
	public String hello(Model model){
	model.addAttribute("msg", "你好spring mvc");
	        return "index";
	  }
	
	@RequestMapping(value="/list.do",method=RequestMethod.GET)
	public String list(Model model){
	model.addAttribute("msg", "你好spring mvc");
	        return "bootstrap/demo/demo1";
	  }
	
	

	@RequestMapping(value = "/query.do")
	@ResponseBody
	public List<DataDto> query(Model model, Integer pageNo,Integer type) {
		
		System.out.println("pageNo="+pageNo);
//		if (pageNo == null || pageNo < 1) {
//			pageNo = 0;
//		}else{
//			pageNo = pageNo-1;
//		}   
		
		String str = "向下滑动屏幕进行分页加载数据";
		if(type == 2){
			str = "向左滑动屏幕";
		}else if(type == 3){
			str = "向右滑动屏幕";
		}
		
		List<DataDto> datas = new ArrayList<DataDto>();
		for (int i = pageNo * 15; i < (pageNo + 1) * 15; i++) {
			DataDto data = new DataDto("10000" + i, str + i, new Date().getTime()+"");
			datas.add(data);
		}
		System.out.println("datas="+datas);
		try {
			Thread.sleep(100L);
		} catch (InterruptedException e) {
			e.printStackTrace();   
		}
		return datas;
	}

	@RequestMapping(value="/showinfo.do")
	public String showinfo(Model model,Integer id){
		System.out.println(id);
		return "left";
	}
	@RequestMapping(value="date.do")
	public String dateTest(Model model,String dateSelectorOne,String dateSelectorTwo){
		System.out.println(dateSelectorOne);
		System.out.println(dateSelectorTwo);
		model.addAttribute("args","参数已提交");
		return "date";
	}

	
	
	//手机文件上传测试
	@RequestMapping(value="/upload.do")
	 public String upload(@RequestParam("file") MultipartFile file,
	            HttpServletRequest request){

	        if (!file.isEmpty()) {

	            String contextPath = request.getContextPath();//"/SpringMvcFileUpload"
	            String servletPath = request.getServletPath();//"/gotoAction"
	            String scheme = request.getScheme();//"http"
	       

	            String storePath= "E:\\project";//存放我们上传的文件路径

	            String fileName = file.getOriginalFilename();

	            File filepath = new File(storePath, fileName);

	            if (!filepath.getParentFile().exists()) {

	                filepath.getParentFile().mkdirs();//如果目录不存在，创建目录

	            }

	            try {
	                file.transferTo(new File(storePath+File.separator+fileName));//把文件写入目标文件地址

	            } catch (Exception e) {

	                e.printStackTrace();

	                return "error";

	            }

	            return "upload";//返回到成功页面

	        }else {

	            return "error";//返回到失败的页面
	        }

	    }
}
