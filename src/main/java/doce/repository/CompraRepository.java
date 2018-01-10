package doce.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import doce.models.Compra;
import doce.models.StatusCompra;
@Repository
public interface CompraRepository extends CrudRepository<Compra, Long> {	
	public List<Compra> findByDataCompraBetween(Date dataInicial, Date dataFinal);
	public List<Compra> findByDataCompraBetweenAndStatus(Date dataInicial, Date dataFinal,StatusCompra status);
}
