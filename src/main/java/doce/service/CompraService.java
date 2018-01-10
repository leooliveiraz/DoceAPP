package doce.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import doce.models.CarrinhoItem;
import doce.models.Compra;
import doce.models.CompraItem;
import doce.models.StatusCompra;
import doce.repository.CompraRepository;

@Service
public class CompraService {
	@Autowired
	CompraRepository compraRepository;

	public void salvar(Compra compra,Map<CarrinhoItem, Integer> itensCarrinho) {
		List<CompraItem> itens = new ArrayList<CompraItem>();
		for(CarrinhoItem carrinhoItem :itensCarrinho.keySet()) {
			Integer quantidade = itensCarrinho.get(carrinhoItem);
			CompraItem item = new CompraItem(null,carrinhoItem.getProduto(),quantidade,carrinhoItem.getPreco(),carrinhoItem.getTotal(quantidade));
			itens.add(item);
		}
		
		compra.setItens(itens);
		//compra.getItens().forEach(it -> it.setCompra(compra));
		
		compraRepository.save(compra);
	}

	public List<Compra> listar() {
		Iterable<Compra> lista =compraRepository.findAll();
		List<Compra> compras = new ArrayList<Compra>();
		lista.forEach(compra -> compras.add(compra));
		compras.stream().sorted((c1, c2) -> c2.getId().compareTo(c1.getId()));
		return  compras;
	}

	public List<Compra> filtrar( Date dataInicial,Date dataFinal,String status) {
		Iterable<Compra> lista ;
		if(status.equals("TODOS")) {
			lista =compraRepository.findByDataCompraBetween(dataInicial, dataFinal);
		}else {
			StatusCompra statusCompra = StatusCompra.valueOf(status);
			lista =compraRepository.findByDataCompraBetweenAndStatus(dataInicial, dataFinal,statusCompra);
		}
		List<Compra> compras = new ArrayList<Compra>();
		lista.forEach(compra -> compras.add(compra));
		compras.stream().sorted((c1, c2) -> c2.getId().compareTo(c1.getId()));
		return  compras;
	}
	
	public Compra encontrar(Long id) {
		return compraRepository.findOne(id);
	}
	
	public void alterar(Compra compra) {		
		compraRepository.save(compra);
	}
	
}
