package doce.controller;

import java.net.MalformedURLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import doce.models.Compra;
import doce.models.StatusCompra;
import doce.service.CompraService;

@Controller
@RequestMapping("/compras")
public class CompraController {
	@Autowired
	CompraService compraService;

	@RequestMapping("/pedidos")
	public ModelAndView pedidos() {
		ModelAndView mv = new ModelAndView("/compras/pedidos");
		List<Compra> compras = compraService.listar();
		mv.addObject("compras", compras);
		return mv;
		
	}

	@RequestMapping("/pedidos/{id}")
	public ModelAndView pedidos(@PathVariable Long id) {
		ModelAndView mv = new ModelAndView("/compras/alterar_pedido");
		Compra compra = compraService.encontrar(id);
		mv.addObject("status", StatusCompra.values());
		mv.addObject("compra", compra);
		return mv;
		
	}
	

    @RequestMapping(value="/alterar",method=RequestMethod.POST)
	public ModelAndView finalizar(Compra compra ,RedirectAttributes redirectAttributes) throws MalformedURLException{
    	ModelAndView mv = new ModelAndView("redirect:/compras/pedidos");
    	Compra compra2 = compraService.encontrar(compra.getId());
    	compra.setItens(compra2.getItens());
    	compraService.alterar(compra);
    	redirectAttributes.addFlashAttribute("sucesso", "Pedido alterado com sucesso.");
    	
		return mv;
	}
}
