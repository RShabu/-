package com.project.portfolio.controller.boardCtr;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.portfolio.model.ArticleVO;
import com.project.portfolio.model.BoardVO;
import com.project.portfolio.paging.Pager;
import com.project.portfolio.service.ArticleSrv;

@Controller
@RequestMapping("/article")
public class ArticleCtr {

	@Autowired
	ArticleSrv artSrv;

	@RequestMapping("/grp_article_list")
	public ModelAndView grpBoardList(
			@RequestParam(defaultValue = "") String words,
			@RequestParam(defaultValue = "subject") String searchOpt,
			@RequestParam(defaultValue = "1") int curPage,
			@RequestParam String boardCode) {
		
		ModelAndView mav = new ModelAndView();
		int count = artSrv.getArticleCount(searchOpt, words, boardCode);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		BoardVO bvo = artSrv.getBoardOne(boardCode);
		List<ArticleVO> list = artSrv.getArticleList(start, end, words, searchOpt, boardCode);
		
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
		mav.addObject("boardCode", boardCode);
		mav.addObject("boardColor", bvo.getBoardColor());
		mav.addObject("boardTitle", bvo.getBoardTitle());
		
		mav.setViewName("grp_board/grp_article_list");

		return mav;
	}
	
	@RequestMapping(value = "/grp_article_insert", method = RequestMethod.GET)
	public ModelAndView getArticleInsert(@RequestParam String boardCode) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardCode", boardCode);
		
		BoardVO bvo = artSrv.getBoardOne(boardCode);
		mav.addObject("boardColor", bvo.getBoardColor());
		mav.addObject("boardTitle", bvo.getBoardTitle());
		mav.addObject("boardWrite", bvo.getBoardWrite());
		
		mav.setViewName("grp_board/grp_article_insert");
		return mav;
	}
	
	@RequestMapping(value = "/grp_article_insert", method=RequestMethod.POST)
	public String setArticleDo(
			@ModelAttribute ArticleVO vo,
			@RequestPart MultipartFile files) throws IllegalStateException, IOException {
		
		//System.out.println(vo.getBoardCode());
		
		if (files.isEmpty()) { // 업로드할 파일이 없을 시
			artSrv.setArticle(vo);
			
		} else {
			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "c://upload//fileUpload//";

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

				destinationFile.getParentFile().mkdirs();
				files.transferTo(destinationFile);
	
				vo.setFileName(destinationFileName);
				vo.setFileOriName(fileName);
				vo.setFileUrl(fileUrl);
				artSrv.setArticle(vo);
		}
		
		return "redirect:/article/grp_article_list?boardCode="+vo.getBoardCode();
	}
	
	@RequestMapping(value = "/grp_article_reply", method = RequestMethod.GET)
	public ModelAndView getArticleReply(@ModelAttribute ArticleVO vo) {
		ArticleVO avo = artSrv.getArticleOne(vo);
		BoardVO bvo = artSrv.getBoardOne(vo.getBoardCode());
		
		ModelAndView mav = new ModelAndView();
		
		if( avo != null ) {
			mav.addObject("article", avo);
			mav.addObject("boardCode", vo.getBoardCode());
			mav.addObject("boardTitle", bvo.getBoardTitle());
			mav.addObject("boardColor", bvo.getBoardColor());
			mav.addObject("boardReply", bvo.getBoardReply());
			
			mav.setViewName("grp_board/grp_article_reply");
		}

		return mav;
	}
	
	
	@RequestMapping(value = "/grp_article_reply", method=RequestMethod.POST)
	public String setArticleReply(
			@ModelAttribute ArticleVO vo,
			@RequestPart MultipartFile files) throws Exception {
		
		
		if (files.isEmpty()) { // 업로드할 파일이 없을 시
			artSrv.setArticleReply(vo);
			
		} else {
			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "c://upload//fileUpload//";

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

				destinationFile.getParentFile().mkdirs();
				files.transferTo(destinationFile);
	
				vo.setFileName(destinationFileName);
				vo.setFileOriName(fileName);
				vo.setFileUrl(fileUrl);
				artSrv.setArticleReply(vo);
		}
		
		return "redirect:/article/grp_article_list?boardCode="+vo.getBoardCode();
	}
	
	@RequestMapping(value = "/grp_article_modify", method = RequestMethod.GET)
	public ModelAndView getArticleModify(@ModelAttribute ArticleVO vo) {
		ArticleVO avo = artSrv.getArticleOne(vo);
		BoardVO bvo = artSrv.getBoardOne(vo.getBoardCode());
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("article", avo);
		mav.addObject("ArticleModify", avo);
		mav.addObject("boardCode", vo.getBoardCode());
		mav.addObject("boardColor", bvo.getBoardColor());
		mav.addObject("boardTitle", bvo.getBoardTitle());
		mav.setViewName("grp_board/grp_article_modify");
		return mav;
	}
	
	@RequestMapping(value = "/grp_article_modify", method = RequestMethod.POST)
	public String setArticleModify(@ModelAttribute ArticleVO vo) {
		artSrv.setArticleModify(vo);
		return "redirect:/article/grp_article_list?boardCode="+vo.getBoardCode();
	}
	
	@RequestMapping(value = "/grp_article_view", method = RequestMethod.GET)
	public ModelAndView getArticleView(@ModelAttribute ArticleVO vo) {
		ArticleVO avo = artSrv.getArticleOne(vo);
		BoardVO bvo = artSrv.getBoardOne(vo.getBoardCode());
		ModelAndView mav = new ModelAndView();
		artSrv.hitUp(vo);
		mav.addObject("article", avo);
		mav.addObject("boardCode", vo.getBoardCode());
		mav.addObject("boardTitle", bvo.getBoardTitle());
		mav.addObject("boardColor", bvo.getBoardColor());
		mav.addObject("boardRead", bvo.getBoardRead());
		mav.addObject("boardDownload", bvo.getBoardDownload());
		
		mav.setViewName("grp_board/grp_article_view");
		//System.out.println(avo);

		return mav;
	}
	
	@RequestMapping(value = "/grp_article_delete", method = RequestMethod.GET)
	public String getArticleDelete() {
		return "grp_board/grp_article_delete";
	}
	
	@RequestMapping(value = "/grp_article_delete", method = RequestMethod.POST)
	@ResponseBody
	public String setArtcileDelete(@ModelAttribute ArticleVO vo) {
		
		ArticleVO avo = artSrv.getArticleOne(vo);
		if( avo.getFileName() != null ) {
			String fileUrl = "c://upload//fileUpload//";
			File file = new File(fileUrl + avo.getFileName());
			if( file.exists() ) {
				file.delete();
			}
		}
		artSrv.setArticleDelete(vo.getArticleid(), vo.getBoardCode());
		return "success";
	}
}
