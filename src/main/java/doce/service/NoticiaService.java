package doce.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import doce.models.Noticia;
import doce.repository.NoticiaRepository;

@Service
public class NoticiaService {
	@Autowired
	NoticiaRepository noticiaRepository;

	public void salvar(Noticia noticia) {
		noticiaRepository.save(noticia);
	}

	public List<Noticia> listar() {
		Iterable<Noticia> lista =noticiaRepository.findAll();
		List<Noticia> noticias = new ArrayList<Noticia>();
		lista.forEach(noticia -> noticias.add(noticia));
		noticias.stream().sorted((c1, c2) -> c2.getId().compareTo(c1.getId()));
		return  noticias;
	}
	
	public List<Noticia> listarUltimas() {
		List<Noticia> noticias = noticiaRepository.findAllByOrderByIdDesc();
		List<Noticia> listaNoticia = noticias.stream().limit(5).collect(Collectors.toList());
		listaNoticia.stream().sorted((c1, c2) -> c2.getId().compareTo(c1.getId()));
		return  listaNoticia;
	}
	
	public Noticia encontrar(Long id) {
		return noticiaRepository.findOne(id);
	}
	
	public void alterar(Noticia compra) {		
		noticiaRepository.save(compra);
	}

	public void deletar(Noticia noticia) {
		noticiaRepository.delete(noticia);
		
	}
	
}
