package doce.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import doce.models.CarrinhoItem;
import doce.models.Produto;

@Service
public class CarrinhoItemService {
	@Autowired
	ProdutoService produtoService;

	public CarrinhoItem criaItem(Long produtoId){
	    Produto produto = produtoService.encontrar(produtoId);
	    CarrinhoItem carrinhoItem = new CarrinhoItem(produto);
	    return carrinhoItem;
	}	
	
}
