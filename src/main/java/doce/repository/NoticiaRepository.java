package doce.repository;


import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import doce.models.Noticia;
@Repository
public interface NoticiaRepository extends CrudRepository<Noticia, Long> {	
	public List<Noticia> findAllByOrderByIdDesc();
}
