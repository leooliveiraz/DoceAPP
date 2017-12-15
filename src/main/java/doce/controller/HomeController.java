package doce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import doce.models.Produto;
import doce.service.ProdutoService;

@Controller
public class HomeController {
	@Autowired
	ProdutoService produtoService;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("index");
		List<Produto> produtos = produtoService.listar();
		mv.addObject("produtos", produtos);
		return mv;
	}
}
