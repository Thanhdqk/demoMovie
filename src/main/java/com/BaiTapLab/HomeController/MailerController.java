package com.BaiTapLab.HomeController;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.BaiTapLab.Helper.MailerHelper;
import com.BaiTapLab.Model.MailInfo;
import com.BaiTapLab.Service.MailerService;

@Controller
@RequestMapping("mailer")
public class MailerController {
	@Autowired
	MailerService mailer;

	@GetMapping("")
	public String mailViewer() {
		return "mail/index";
	}

//	@ResponseBody
//	@PostMapping("/send")
//	public String send(Model model, 
//			@RequestParam String txtTo, 
//			@RequestParam String txtCC,
//			@RequestParam String txtBCC,
//			@RequestParam String txtSubject,
//			@RequestParam String txtContent,
//			@RequestParam("files") MultipartFile[] multipartFiles
//			/*@RequestParam("file1") MultipartFile multipartFile1*/) throws IOException {
//		MailerHelper helper=new MailerHelper();
//		List<File> files=new ArrayList<>();
//		String[] emailCC=helper.parseStringEmailToArray(txtCC);
//		String[] emailBCC=helper.parseStringEmailToArray(txtBCC);
//		MailInfo mail = new MailInfo();
//		mail.setTo(txtTo);
//		mail.setCc(emailCC);
//		mail.setBcc(emailBCC);
//		mail.setSubject(txtSubject);
//		mail.setBody(txtContent);
//		//covert MultipartFile to File
////		if(!multipartFile.isEmpty()) {
////			File file=helper.convertMultipartFileToFile(multipartFile);
////			files.add(file);
////			//Set cho MailInfo
////			mail.setFiles(files);			
////		}
//		for (MultipartFile multipartFile : multipartFiles) {
//			if (!multipartFile.isEmpty()) {
//				File file = helper.convertMultipartFileToFile(multipartFile);
//				files.add(file);
//			}
//		}
//		mail.setFiles(files);
////		if(!multipartFile1.isEmpty()) {
////			File file=helper.convertMultipartFileToFile(multipartFile1);
////			files.add(file);
////			//Set cho MailInfo
////			mail.setFiles(files);			
////		}
//		//Gửi mail vào queue
//		mailer.queue(mail);
//		//gửi mail trực tiếp
//		//mailer.send(mail);
//		
////		try {
////			mailer.send(mail);
////		}catch(Exception e) {
////			System.out.println(e.getMessage());
////		}
//		return "<h1>Mail của bạn đã được gửi đi</h1>";
//	}
	
	//@ResponseBody
	@PostMapping("/send")
	public String send(Model model, 
			@RequestParam String txtTo, 
			@RequestParam String txtCC,
			@RequestParam String txtBCC,
			@RequestParam String txtSubject,
			@RequestParam String txtContent,
			@RequestParam("files") MultipartFile[] multipartFiles) throws IOException {
		
		MailerHelper helper = new MailerHelper();
		List<File> files = new ArrayList<>();
		String[] emailCC = helper.parseStringEmailToArray(txtCC);
		String[] emailBCC = helper.parseStringEmailToArray(txtBCC);
		MailInfo mail = new MailInfo();
		mail.setTo(txtTo);
		mail.setCc(emailCC);
		mail.setBcc(emailBCC);
		mail.setSubject(txtSubject);
		mail.setBody(txtContent);
		
		// Convert each MultipartFile to File and add to the list
		for (MultipartFile multipartFile : multipartFiles) {
			if (!multipartFile.isEmpty()) {
				File file = helper.convertMultipartFileToFile(multipartFile);
				files.add(file);
			}
		}
		
		// Set files to MailInfo
		mail.setFiles(files);
		
		// Send mail
		//mailer.queue(mail);
		// mailer.send(mail);
		try {
	        // Send mail using a queue or send directly (consider error handling)
	        mailer.queue(mail); // OR mailer.send(mail);

	        // Upon successful queuing or sending, add attribute to model
	        model.addAttribute("sendMailSuccess", "Send Mail Success !");
	        return "mail/index"; // OR redirect to success page (consider UI framework)
	    } catch (Exception e) {
	        // Handle potential exceptions during sending
	        model.addAttribute("sendMailError", e.getMessage());
	        return "error"; // OR redirect to error page (consider UI framework)
	    }

		//return "";
	}

}
