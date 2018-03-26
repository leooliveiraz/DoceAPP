package doce.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;
@Entity
@Getter
@Setter
public class Produto {
	@Id
	@GeneratedValue
	public Long id;
	public String nome;
	public String descricao;
	public Double valor;
	public Double valor_desconto;
	public Boolean prioridade;
	public String link_imagem;
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Produto other = (Produto) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	public String getNomeUrl() {
		String nomeUrl = nome+"";
		nomeUrl = nomeUrl.replaceAll(" ", "+");
		return nomeUrl;
	}
	
	public String buscaFoto() {
		if(link_imagem != null && !link_imagem.isEmpty()) {
			return link_imagem;
		}else {
			return "";
		}
	}
	
}
