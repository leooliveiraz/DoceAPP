package doce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import doce.models.Produto;
import doce.service.ProdutoService;

@Controller
@RequestMapping("/cardapio")
public class CardapioController {
	@Autowired
	ProdutoService produtoService;
	
	@RequestMapping("/")
	public ModelAndView listaProdutos() {
		ModelAndView mv = new ModelAndView("/cardapio/cardapio");
		List<Produto> produtos = produtoService.listar();
		mv.addObject("produtos", produtos);
		
		return mv;
	}

}
