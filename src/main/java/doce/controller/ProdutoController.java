package doce.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import doce.models.Produto;
import doce.service.ProdutoService;

@Controller
@RequestMapping("/produtos")
public class ProdutoController {
	@Autowired
	ProdutoService produtoService;
	
	@RequestMapping("/lista")
	public ModelAndView listaProdutos() {
		ModelAndView mv = new ModelAndView("/produto/lista_produtos");
		List<Produto> produtos = produtoService.listar();
		mv.addObject("produtos", produtos);
		
		return mv;
	}

	@RequestMapping("/alterar/{id}")
	public ModelAndView detalhe(@PathVariable("id") Long id) {
		ModelAndView mv = new ModelAndView("/produto/alterar_produto");
		Produto produto = produtoService.encontrar(id);
		mv.addObject("produto", produto);
		return mv;
	}
	@RequestMapping("/novo")
	public ModelAndView novo() {
		ModelAndView mv = new ModelAndView("/produto/novo_produto");
		return mv;
	}
	@RequestMapping("/salvar")
	public ModelAndView salvar(Produto produto,RedirectAttributes redirectAttributes)  throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/produtos/lista");				
		produtoService.salvar(produto);
    	redirectAttributes.addFlashAttribute("sucesso", "Produto adicionado com sucesso.");
		return mv;
	}

	@RequestMapping(value="/alterar",method=RequestMethod.POST)
	public ModelAndView alterar(Produto produto,RedirectAttributes redirectAttributes) throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/produtos/lista");			
		produtoService.salvar(produto);
    	redirectAttributes.addFlashAttribute("sucesso", "Produto alterado com sucesso.");
		return mv;
	}	

}
