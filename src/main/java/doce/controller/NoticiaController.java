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

import doce.models.Noticia;
import doce.service.NoticiaService;
@Controller
@RequestMapping("/noticias")
public class NoticiaController {
	@Autowired
	private NoticiaService noticiaService;

	@RequestMapping("/")
	public ModelAndView lista() {
		ModelAndView mv = new ModelAndView("/noticia/lista_noticia");
		List<Noticia> noticias = noticiaService.listar();
		mv.addObject("noticias", noticias);
		return mv;
	}
	@RequestMapping("/nova")
	public ModelAndView nova() {
		ModelAndView mv = new ModelAndView("/noticia/nova_noticia");
		return mv;
	}

	@RequestMapping("/{id}")
	public ModelAndView detalhes(@PathVariable Long id) {
		ModelAndView mv = new ModelAndView("/noticia/alterar_noticia");
		Noticia noticia = noticiaService.encontrar(id);
		mv.addObject("noticia", noticia);
		return mv;
	}
	@RequestMapping(value="/salvar",method=RequestMethod.POST)
	public ModelAndView salvar(Noticia noticia,RedirectAttributes redirectAttributes)  throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/noticias/");				
		noticiaService.salvar(noticia);
    	redirectAttributes.addFlashAttribute("sucesso", "Notícia adicionada com sucesso.");
		return mv;
	}
	@RequestMapping(value="/alterar",method=RequestMethod.POST)
	public ModelAndView alterar(Noticia noticia,RedirectAttributes redirectAttributes)  throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/noticias/");				
		noticiaService.salvar(noticia);
    	redirectAttributes.addFlashAttribute("sucesso", "Notícia alterada com sucesso.");
		return mv;
	}
	@RequestMapping(value="/excluir",method=RequestMethod.POST)
	public ModelAndView excluir(Noticia noticia,RedirectAttributes redirectAttributes)  throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/noticias/");				
		noticia = noticiaService.encontrar(noticia.getId());
		noticiaService.deletar(noticia);
    	redirectAttributes.addFlashAttribute("sucesso", "Notícia excluída com sucesso.");
		return mv;
	}
}	
