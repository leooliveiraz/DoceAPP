package doce.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import doce.models.Produto;
import doce.infra.FileSaver;
import doce.service.ProdutoService;

@Controller
@RequestMapping("/produtos")
public class ProdutoController {
	@Autowired
	ProdutoService produtoService;
	@Autowired
	private FileSaver fileSaver;
	
	@RequestMapping("/lista")
	public ModelAndView listaProdutos() {
		ModelAndView mv = new ModelAndView("/produto/lista_produtos");
		List<Produto> produtos = produtoService.listar();
		mv.addObject("produtos", produtos);
		
		return mv;
	}

	@RequestMapping("/alterar/{id}")
	public ModelAndView detalhe(@PathVariable("id") Long id) {
		ModelAndView mv = new ModelAndView("/produto/alterar");
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
	public ModelAndView salvar(MultipartFile imagem_principal,Produto produto) throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/produtos/lista");		
		if (imagem_principal != null && !imagem_principal.getOriginalFilename().isEmpty()) {
			File arquivo = fileSaver.multipartToFile(imagem_principal);			
			String base64 = fileSaver.encodeFileToBase64Binary(arquivo);
			produto.setImagem(base64);
		}		
		produtoService.salvar(produto);
		return mv;
	}

	@RequestMapping(value="/alterar",method=RequestMethod.POST)
	public ModelAndView alterar(MultipartFile imagem_principal,Produto produto) throws IOException {
		System.out.println(produto.getId());
		ModelAndView mv = new ModelAndView("redirect:/produtos/lista");		
		if (imagem_principal != null && !imagem_principal.getOriginalFilename().isEmpty()) {
			File arquivo = fileSaver.multipartToFile(imagem_principal);			
			String base64 = fileSaver.encodeFileToBase64Binary(arquivo);
			produto.setImagem(base64);
		}		
		produtoService.salvar(produto);
		return mv;
	}
}
