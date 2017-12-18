package doce.models;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CarrinhoItem {
	private Produto produto;
	
	public Double getPreco(){
		if(produto.valor_desconto !=null) {
			return produto.valor_desconto;			
		}else {
			return produto.valor;			
		}
	}
	public Double getTotal(int quantidade) {
		return this.getPreco()*(new Double(quantidade));
	}
	
	// =======================================================================
	public CarrinhoItem(Produto produto) {
		super();
		this.produto = produto;
	}

	public CarrinhoItem() {
		super();
	}
	
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((produto == null) ? 0 : produto.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CarrinhoItem other = (CarrinhoItem) obj;
		if (produto == null) {
			if (other.produto != null)
				return false;
		} else if (!produto.equals(other.produto))
			return false;
		return true;
	}
	
	
	
}
