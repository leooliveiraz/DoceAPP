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

import doce.models.Usuario;
import doce.service.UsuarioService;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	@Autowired
	UsuarioService usuarioService;
	
	@RequestMapping("/lista")
	public ModelAndView lista() {
		ModelAndView mv = new ModelAndView("usuario/lista_usuario");
		List<Usuario> usuarios = usuarioService.listar();
		mv.addObject("usuarios", usuarios);
		return mv;
	}
	@RequestMapping("/novo")
	public ModelAndView nova() {
		ModelAndView mv = new ModelAndView("usuario/novo_usuario");
		return mv;
	}

	@RequestMapping(value="/salvar",method=RequestMethod.POST)
	public ModelAndView salvar(Usuario usuario,String senha_validacao,RedirectAttributes redirectAttributes)  throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/usuarios/lista");		
		if(!usuario.getSenha().equals(senha_validacao)) {
			mv = new ModelAndView("usuario/novo_usuario");	
	    	redirectAttributes.addFlashAttribute("erro", "Informe as duas senhas iguais.");
		}
		if(usuarioService.verificaExistencia(usuario)){
			mv = new ModelAndView("usuario/novo_usuario");	
	    	redirectAttributes.addFlashAttribute("erro", "Já existe usuário com esse email.");
		}
		usuarioService.salvar(usuario);
    	redirectAttributes.addFlashAttribute("sucesso", "Usuário alterado com sucesso.");
		return mv;
	}
	

	@RequestMapping("/alterar/{cpf}")
	public ModelAndView detalhe(@PathVariable String cpf) {
		ModelAndView mv = new ModelAndView("usuario/alterar_usuario");
		Usuario usuario = usuarioService.encontrarCPF(cpf);
		mv.addObject("usuario",usuario);
		return mv;
	}
	

	@RequestMapping(value="/alterar",method=RequestMethod.POST)
	public ModelAndView alterar(Usuario usuario,String senha_validacao,RedirectAttributes redirectAttributes)  throws IOException {
		ModelAndView mv = new  ModelAndView("redirect:/usuarios/lista");		
		System.out.println(usuario.toString());
		usuarioService.alterar(usuario);
    	redirectAttributes.addFlashAttribute("sucesso", "Usuário alterado com sucesso.");
		mv.addObject("usuario",usuario);
		return mv;
	}
}
