package doce.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import doce.models.Compra;
@Repository
public interface CompraRepository extends CrudRepository<Compra, Long> {	
	
}
