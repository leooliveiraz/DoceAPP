package doce.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Noticia {
	@Id
	@GeneratedValue
	private Long id;
	@Lob
	private String imagem;
	private String link;
	private String titulo;
	private String descricao;
	
	public Noticia(Long id, String imagem, String link, String titulo, String descricao) {
		super();
		this.id = id;
		this.imagem = imagem;
		this.link = link;
		this.titulo = titulo;
		this.descricao = descricao;
	}
	public Noticia() {
		super();
	}
	@Override
	public String toString() {
		return "Noticia [id=" + id + ", imagem=" + imagem + ", link=" + link + ", titulo=" + titulo + ", descricao="
				+ descricao + "]";
	}
	
	
	
}
