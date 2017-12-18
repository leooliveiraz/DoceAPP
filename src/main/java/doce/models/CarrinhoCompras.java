package doce.models;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import lombok.Getter;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION)
public class CarrinhoCompras implements Serializable {

	private static final long serialVersionUID = -6993717667132261701L;
	private Map<CarrinhoItem, Integer> itens = new LinkedHashMap<CarrinhoItem, Integer>();
	@Getter
	private Calendar dataCarrinho = Calendar.getInstance();
	
	public void add(CarrinhoItem item,Integer quantidade){
		itens.put(item, getQuantidade(item) + quantidade);
		dataCarrinho = Calendar.getInstance();
	}

	public void alterar(CarrinhoItem item,Integer quantidade){
		if(quantidade ==0) {
			itens.remove(item);
		}else {
			itens.put(item,  quantidade);
		}
		dataCarrinho = Calendar.getInstance();
	}

	public int getQuantidade(CarrinhoItem item) {
		if(!itens.containsKey(item)){
			itens.put(item, 0);
		}
		return itens.get(item);
	}
	
	public int getQuantidade(){
		return itens.values().stream().reduce(0, (proximo, acumulador) -> (proximo + acumulador));
	}

	public Collection<CarrinhoItem> getItens() {
	    return itens.keySet();
	}

	public Map<CarrinhoItem, Integer> getItensMap() {
	    return itens;
	}
	public Double getTotal(CarrinhoItem item){
	    return item.getTotal(getQuantidade(item));
	}
	public Double getTotal(){
		Double total = Double.valueOf(0);
	    for (CarrinhoItem item : itens.keySet()) {
	        total = total+(getTotal(item));
	    }
	    return total;
	}
	public void limpar() {
		itens = new LinkedHashMap<CarrinhoItem, Integer>();
	}
	
}