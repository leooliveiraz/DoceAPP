package doce.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import doce.models.Usuario;

@Repository
public interface UsuarioRepository  extends CrudRepository<Usuario, Long> {	
	List<Usuario> findByEmail(String nome);
	List<Usuario> findByCpf(String cpf);
}












