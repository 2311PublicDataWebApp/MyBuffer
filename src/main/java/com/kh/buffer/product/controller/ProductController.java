 package com.kh.buffer.product.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.buffer.product.domain.IngredientVO;
import com.kh.buffer.product.domain.PageInfo;
import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.product.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;

	/**
	 * 게시물 등록 페이지, /product/insert.kr을 주소표시줄에 입력하면 insert.jsp가 나타나도록
	 */
	@RequestMapping(value = "/product/insert.do", method = RequestMethod.GET)
	public String showInsertForm(Model model) {
		return "product/insert";
	}

	/**
	 * 게시물 등록 POST
	 */
	@RequestMapping(value = "/product/insert.do", method = RequestMethod.POST)
	public String insertProduct(Model model
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			, @ModelAttribute ProductVO product
			, HttpServletRequest request
			, HttpSession session) {
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				Map<String, Object> infoMap = this.saveFile(uploadFile, request);
				String fileName = (String)infoMap.get("fileName");
				String fileRename = (String)infoMap.get("fileRename");
				String filePath = (String)infoMap.get("filePath");
				long fileSize = (long)infoMap.get("fileSize");
				
				product.setProductFileName(fileName);
				product.setProductFileRename(fileRename);
				product.setProductFilePath(filePath);
				product.setProductFileSize(fileSize);
			}
			int result = pService.insertProduct(product);
			if (result > 0) {
				return "redirect:/product/list.do";
			} else {
				model.addAttribute("msg", "요청하신 서비스가 완료되지 못했습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	/**
	 * 게시물 상세 페이지
	 */
	@RequestMapping(value = "/product/productDetail.do", method = RequestMethod.GET)
	public ModelAndView showDetailForm(ModelAndView mv, int productNo) {
		try {	
			ProductVO product = pService.selectProductByNo(productNo);
			List<IngredientVO> iList = pService.selectIngredientByNo(productNo);
			if(product != null) {
				mv.addObject("product", product);
				mv.addObject("iList", iList);
				mv.setViewName("product/productDetail");
			}else {
				mv.addObject("msg", "요청하신 서비스가 완료되지 못했습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 게시물 수정 페이지
	 */
	@RequestMapping(value = "/product/modify.do", method = RequestMethod.GET)
	public String showModifyForm(Model model, int productNo) {
			ProductVO product = pService.selectProductByNo(productNo);
			model.addAttribute("product", product);
			return "product/modify";
	}

	/**
	 * 게시물 수정 POST
	 */
	@RequestMapping(value = "/product/modify.do", method = RequestMethod.POST)
	public ModelAndView modifyProduct(ModelAndView mv
			, @ModelAttribute ProductVO product
			, @RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile
			, HttpServletRequest request) {
		try {
			if (reloadFile != null && !reloadFile.isEmpty()) {
				String fileName = product.getProductFileRename();
				if (fileName != null) {
					// 있으면 기존 파일 삭제
					this.deleteFile(request, fileName);
				}
				// 없으면 새로 업로드하려는 파일 저장
				Map<String, Object> infoMap = this.saveFile(reloadFile, request);
				String productFileName = (String)infoMap.get("fileName");
				product.setProductFileName(productFileName);
				product.setProductFileRename((String) infoMap.get("fileRename"));
				product.setProductFilePath((String) infoMap.get("filePath"));
				product.setProductFileSize((long) infoMap.get("fileSize"));
			}
			int result = pService.modifyProduct(product);
			if (result > 0) {
				mv.setViewName("redirect:/product/list.do");
			} else {
				mv.addObject("msg", "요청하신 서비스가 완료되지 못했습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * 게시물 삭제
	 */
	@RequestMapping(value = "/product/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteProduct(ModelAndView mv, int productNo) {
		try {
			int result = pService.deleteProduct(productNo);
			if (result > 0) {
				mv.setViewName("redirect:/product/list.do");
			} else {
				mv.addObject("msg", "요청하신 서비스가 완료되지 못했습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 게시물 리스트 목록 GET
	 */
	@RequestMapping(value = "/product/list.do", method = RequestMethod.GET)
	public String showProductList(Model model
			, HttpServletRequest request
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			int totalCount = pService.getTotalCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<ProductVO> pList = pService.selectProductList(pInfo);
			String rPath = request.getSession().getServletContext().getRealPath("resources");
			String imgFilepath = rPath + "/puploadFiles/";
			if (!pList.isEmpty()) {
				model.addAttribute("pList", pList);
				model.addAttribute("pInfo", pInfo);
				model.addAttribute("imgFilepath", imgFilepath);
			} else {
				model.addAttribute("pList", null);
			}
			return "product/list";
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}

	/**
	 * 첨부파일 저장
	 */
	private Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws Exception {
		String fileName = uploadFile.getOriginalFilename();
		
		// 저장 경로
		String projectPath = request.getSession().getServletContext().getRealPath("resources");
		String saveDirectory = projectPath + "/puploadFiles";
		File sDir = new File(saveDirectory);
		if (!sDir.exists()) {
			sDir.mkdir(); // uploadFile 폴더가 없을 시 자동 생성
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String strResult = sdf.format(new Date(System.currentTimeMillis()));
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String fileRename = strResult + "." + ext;

		String savePath = saveDirectory + "/" + fileRename;
		File file = new File(savePath);

		uploadFile.transferTo(file);
		long fileLength = uploadFile.getSize();
		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("fileName", fileName);
		infoMap.put("fileRename", fileRename);
		infoMap.put("filePath", savePath);
		infoMap.put("fileSize", fileLength);
		return infoMap;
	}

	/**
	 * 저장되어 있는 첨부파일 삭제
	 */
	private void deleteFile(HttpServletRequest request, String fileName) {
		String rPath = request.getSession().getServletContext().getRealPath("resources");
		String delFilepath = rPath + "/puploadFiles/" + fileName;
		File delFile = new File(delFilepath);
		if (delFile.exists()) {
			delFile.delete();
		}

	}

	/**
	 * 페이징 처리
	 */
	private PageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		PageInfo pInfo = new PageInfo();
		int recordPerPage = pInfo.getRecordPerPage();
		int naviPerPage = pInfo.getNaviPerPage();
		int naviTotalCount;
		int startNavi;
		int endNavi;
		if ((totalCount % recordPerPage) > 0) {
			naviTotalCount = (totalCount / recordPerPage) + 1;
		} else {
			naviTotalCount = (totalCount / recordPerPage);
		}
		startNavi = ((currentPage - 1) / naviPerPage) * naviPerPage + 1;
		endNavi = startNavi + naviPerPage - 1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pInfo.setCurrentPage(currentPage);
		pInfo.setNaviTotalCount(naviTotalCount);
		pInfo.setStartNavi(startNavi);
		pInfo.setEndNavi(endNavi);
		return pInfo;
	}

}
