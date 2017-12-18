package doce.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import doce.models.CarrinhoCompras;
import doce.models.CarrinhoItem;
import doce.models.Compra;
import doce.service.CarrinhoItemService;
import doce.service.CompraService;

@Controller
@RequestMapping("/carrinho")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoController {
	
	@Autowired
	private CarrinhoItemService carrinhoItemService;	
	@Autowired
    private CarrinhoCompras carrinho;
	@Autowired
	private CompraService compraService;

    @RequestMapping("/")
    public ModelAndView carrinho() {
    	ModelAndView mv = new ModelAndView("/carrinho/carrinho");
    	return mv;
    }
    
    @RequestMapping(value="/adicionar",method=RequestMethod.POST)
	public ModelAndView adicionar(Long id, Integer quantidade,RedirectAttributes redirectAttributes){
		ModelAndView modelAndView = new ModelAndView("redirect:/cardapio/");
		
		CarrinhoItem carrinhoItem = carrinhoItemService.criaItem(id);
		carrinho.add(carrinhoItem,quantidade);

    	redirectAttributes.addFlashAttribute("sucesso", "Produto adicionado ao carrinho.");
		return modelAndView;
	}
    @RequestMapping("/alterar/{id}")
	public ModelAndView alterarItem(@PathVariable Long id){
		ModelAndView modelAndView = new ModelAndView("/carrinho/alterar_item");
		
		CarrinhoItem item = carrinhoItemService.criaItem(id);
	    
		modelAndView.addObject("item", item);
		return modelAndView;
	}

    @RequestMapping(value="/alterar",method=RequestMethod.POST)
	public ModelAndView alterar(Long id, Integer quantidade,RedirectAttributes redirectAttributes){
    	ModelAndView mv = new ModelAndView("redirect:/cardapio/");
		
		CarrinhoItem carrinhoItem = carrinhoItemService.criaItem(id);
		carrinho.alterar(carrinhoItem,quantidade);
    	redirectAttributes.addFlashAttribute("sucesso", "Produto alterado no carrinho.");
	    
		return mv;
	}
    

    @RequestMapping("/finalizar")
	public ModelAndView informarDados(){
    	ModelAndView mv;	
    	if(carrinho.getQuantidade() > 0) {
    		mv = new ModelAndView("carrinho/finalizar_compra");
    	}else {
    		mv = new ModelAndView("redirect:/cardapio/");
    	}
		return mv;
	}

    @RequestMapping("/validardados")
	public ModelAndView validarDados(Compra compra ){
    	ModelAndView mv;	
    	
    	if(carrinho.getQuantidade() > 0 && compra.valido()) {
    		mv = new ModelAndView("carrinho/validar_compra");
    		mv.addObject("compra", compra);
    	}else {
    		mv = new ModelAndView("redirect:/cardapio/");
    	}
		return mv;
	}
    

    @RequestMapping(value="/confirmarcompra",method=RequestMethod.POST)
	public ModelAndView finalizar(Compra compra ,RedirectAttributes redirectAttributes) throws MalformedURLException{
    	
    	ModelAndView mv;	
    	Calendar agora = Calendar.getInstance();
    	if(agora.before(carrinho.getDataCarrinho())) {
    		mv = new ModelAndView("redirect:/carrinho/validardados?nome="+new URL(compra.getNome()).toString()+"&endereco="+new URL(compra.getEndereco()).toString()+"&telefone="+new URL(compra.getTelefone()).toString()+"&email="+new URL(compra.getEmail()).toString()+"");
    		redirectAttributes.addFlashAttribute("erro","Mais produtos foram adicionados, confirme novamente!");
    		return mv;
    	}
    	
    	if(carrinho.getQuantidade() > 0 && compra.valido()) {
    		compra.setValor_total(carrinho.getTotal());
        	compraService.salvar(compra, carrinho.getItensMap());    	
        	carrinho.limpar();
    		
    		mv = new ModelAndView("/carrinho/compra_finalizada");
    		mv.addObject("compra", compra);
    	}else {
    		mv = new ModelAndView("redirect:/cardapio/");
    	}
		return mv;
	}
	
	
}
