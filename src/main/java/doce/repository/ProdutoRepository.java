package doce.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import doce.models.Produto;
@Repository
public interface ProdutoRepository extends CrudRepository<Produto, Long> {	
	List<Produto> findByNomeContainingOrderByPrioridadeDescNomeAsc(String nome);
}
