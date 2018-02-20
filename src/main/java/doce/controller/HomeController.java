package doce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import doce.models.Noticia;
import doce.models.Produto;
import doce.service.NoticiaService;
import doce.service.ProdutoService;

@Controller
public class HomeController {
	@Autowired
	ProdutoService produtoService;
	@Autowired
	NoticiaService noticiaService;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("index");
		List<Produto> produtos = produtoService.listar();
		List<Noticia> noticias = noticiaService.listarUltimas();

		mv.addObject("produtos", produtos);
		mv.addObject("noticias", noticias);
		return mv;
	}
	@RequestMapping("/google15c500e4e06c6979.html")
	public ModelAndView googleSearch() {
		ModelAndView mv = new ModelAndView("googleSearch");
		return mv;
	}
	@RequestMapping("/manifest")
	public ModelAndView manifest() {
		ModelAndView mv = new ModelAndView("manifest");
		return mv;
	}
}
