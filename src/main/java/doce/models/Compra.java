package doce.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Compra {
	@Id
	@GeneratedValue
	private Long id;
	private String nome;
	private String endereco;
	private String telefone;
	private String email;
	private Double valor_total;
	private StatusCompra status= StatusCompra.ABERTO;
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
	private Date dataCompra = new Date();
	

    @OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
    private List<CompraItem> itens;
	
	public Compra(Long id, String nome, String endereco, String telefone, String email) {
		super();
		this.id = id;
		this.nome = nome;
		this.endereco = endereco;
		this.telefone = telefone;
		this.email = email;
	}
	public Compra() {
		super();
	}
	
	@Override
	public String toString() {
		return "Compra [id=" + id + ", nome=" + nome + ", endereco=" + endereco + ", telefone=" + telefone + ", email="
				+ email + "]";
	}	
	
	public Boolean valido() {
		if(!nome.isEmpty() && !telefone.isEmpty() && !endereco.isEmpty()) {
			return Boolean.TRUE;
		}else {
			return Boolean.FALSE;
		}
	}
	
	
}
