package doce.models;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class CompraItem {
	@Id
	@GeneratedValue
	private Long id;
	
	@ManyToOne
	private Produto produto;
	private Integer quantidade;
	private Double valor_unitario;
	private Double valor_total;
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar data = Calendar.getInstance();
	
	public CompraItem(Long id, Produto produto, Integer quantidade, Double valor_unitario, Double valor_total) {
		super();
		this.id = id;
		this.produto = produto;
		this.quantidade = quantidade;
		this.valor_unitario = valor_unitario;
		this.valor_total = valor_total;
	}
	
	public CompraItem() {
		super();
	}
	
}
