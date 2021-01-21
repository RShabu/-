package com.project.portfolio.controller.employeeCtr;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.portfolio.model.EmployeeVO;
import com.project.portfolio.paging.Pager;
import com.project.portfolio.service.EmployeeSrv;
import com.project.portfolio.service.RegisterSrv;

@Controller
@RequestMapping("/employee")
public class EmployeeCtr {

	@Autowired
	EmployeeSrv eSrv;

	@Autowired
	RegisterSrv rSrv;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping("/grp_employee_list")
	public ModelAndView getEmpList(@RequestParam(defaultValue = "") String words,
								   @RequestParam(defaultValue = "empName") String searchOpt,
								   @RequestParam(defaultValue = "1") int curPage) {
		ModelAndView mav = new ModelAndView();

		int count = eSrv.getEmpCount(searchOpt, words);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<EmployeeVO> list = eSrv.getEmpList(start, end, words, searchOpt);
		
		mav.addObject("list", list);
		mav.addObject("words", words);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("count", count);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());
		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("totalPage", pager.getTotPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("selected", pager.getCurPage());
		mav.setViewName("grp_employee/grp_employee_list");
		return mav;
	}

	
	@RequestMapping(value = "/grp_employee_register", method = RequestMethod.GET)
	public String getEmployeeRegister() {
		return "grp_employee/grp_employee_register";
	}
	
	@RequestMapping(value = "/grp_employee_register", method = RequestMethod.POST)
	public String setEmployeeRegister(@ModelAttribute EmployeeVO evo, MultipartFile file) throws IOException {
		Calendar cal = Calendar.getInstance();
		int enterYear  = Integer.parseInt(evo.getEmpEnter().substring(0, 4));
		
		int regYear	= cal.get(Calendar.YEAR);
		
		int stepSize = regYear - enterYear + 1;
		//System.out.println(stepSize);
		evo.setEmpStep(stepSize);
		
		String num = enterYear + evo.getEmpBuseoCode() + evo.getEmpGradeCode();
		evo.setEmpNum(num);
		
		/* 파일 업로드 */
		UUID uuid = UUID.randomUUID();
		
		String orgFileName = uuid.toString() + "_" + file.getOriginalFilename();
		File location = new File(uploadPath+"/emp", orgFileName);
		FileCopyUtils.copy(file.getBytes(), location);
			
		evo.setEmpPhoto(orgFileName);
		/* 파일 업로드 */
		
		rSrv.setEmpRegister(evo);
		rSrv.setEmpRegisterOthers(evo);
		return "redirect:/employee/grp_employee_list";
	}
	
	
	@RequestMapping(value = "/grp_employee_chart", method = RequestMethod.GET)
	public String grpEmployeeChart() {
		return "grp_employee/grp_employee_chart";
	}

	@RequestMapping(value = "/grp_employee_view", method = RequestMethod.GET)
	public ModelAndView getEmployeeView(@RequestParam int empID) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("view", eSrv.getEmpOne(empID));
		mav.setViewName("/grp_employee/grp_employee_view");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/grp_register", method = RequestMethod.GET)
	public String getRegister() {
		return "grp_register";
	}

	@RequestMapping(value = "/grp_register", method = RequestMethod.POST)
	public String setRegister(@ModelAttribute EmployeeVO evo) {
		int enterYear = Integer.parseInt(evo.getEmpEnter().substring(0, 4));
		String bCode = evo.getEmpBuseoCode();
		String gCode = evo.getEmpGradeCode();

		String eNum = enterYear + bCode + gCode;
		evo.setEmpNum(eNum);
		System.out.println(evo.getEmpNum());

		Calendar cal = Calendar.getInstance();
		int hYear = cal.get(Calendar.YEAR);
		int eStep = (hYear - enterYear) + 1;
		evo.setEmpStep(eStep);

		/* 필수 사원 정보 입력 */
		rSrv.setEmpRegister(evo);
		/* 필수 사원 정보 입력 */
		return "redirect:/grp_login";
	}

	@RequestMapping(value = "/grp_admin_register", method = RequestMethod.POST)
	public String setGrpAdminRegister(@ModelAttribute EmployeeVO evo) {
		System.out.println("aaa");
		return "";
	}
}
