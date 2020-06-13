package app.pages;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author jinxiaochi
 * @date  2020年4月16日
 * @effect TODO
 */
@Controller
public class PagesMapping {
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/list")
	public String list() {
		return "index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "index";
	}
	
	@RequestMapping("/detail")
	public String detail() {
		return "index";
	}
	
	@RequestMapping("/publish")
	public String publish() {
		return "index";
	}

}
