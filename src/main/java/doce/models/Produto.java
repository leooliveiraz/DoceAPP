package doce.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;

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
	@Lob
	public String imagem;
}
