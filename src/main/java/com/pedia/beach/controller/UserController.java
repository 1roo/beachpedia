package com.pedia.beach.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pedia.beach.command.UserVO;
import com.pedia.beach.user.service.IUserService;
import com.pedia.beach.util.MailSenderService;
import com.pedia.beach.util.PageVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService service;
	
	@Autowired
	private MailSenderService mailService;
	
	
	// 회원가입 페이지로 이동
	@GetMapping("/join")
	public void userJoin() {
		
	}
	
	// 아이디 중복 확인(비동기)
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		return null;
	}
	
	// 이메일인증
	@ResponseBody
	@GetMapping("/mailCheck")
	public String mailCheck(String email) {
		return null;
	}
	
	// 회원가입 처리
	@PostMapping("/join")
	public String join(UserVO vo, RedirectAttributes ra) {
		log.info("userId : " + vo.getUserId());
		log.info("param: {}" + vo.toString());
		service.join(vo);
		ra.addFlashAttribute("msg", "joinSuccess");
		return "redirect:/user/login";
	}
	
	// 수정 요청
	@GetMapping("/update")
	public String updateUser(UserVO vo, Model model, HttpSession session, HttpServletRequest request) {
		service.updateUser(vo);
		session.invalidate();
		HttpSession newSession = request.getSession(true);
		UserVO updateUser = service.login(vo.getUserId(), vo.getUserPw());
		newSession.setAttribute("user", updateUser);
		return "redirect:/";
	}
	
	// 로그인 페이지로 이동 요청
	@GetMapping("/login")
	public String login(Model model, HttpSession session) {
		session.removeAttribute("user");
		return "user/login";
	}
	
	// 로그인
	@PostMapping("/login")
	public void login(String userId, String userPw, Model model) {
		log.info("로그인 요청");
		model.addAttribute("user", service.login(userId, userPw));
	}
	
	// 마이페이지 
	@GetMapping("/mypage")
	public void userMypage(HttpSession session, Model model, PageVO vo) {
		UserVO user = (UserVO) session.getAttribute("userInfo");
		String id = user.getUserId();
		vo.setLoginId(id);
		model.addAttribute("user", service.getInfo(id, vo));
	}
	
	
	// 로그아웃
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/");
		return mv;
	}
	
	// 회원탈퇴
	@PostMapping("/delete")
	public String deleteUser(UserVO vo, HttpSession session, Model model) throws Exception {
		log.info("회원탈퇴: " + vo.getUserId());
		service.deleteUser(vo);
		session.invalidate();
		return "redirect:/";
	}
	
	
	
}
