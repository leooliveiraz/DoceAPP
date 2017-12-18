package doce.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import doce.models.Usuario;
import doce.repository.UsuarioRepository;

@Service
public class UsuarioService {
	@Autowired 
	UsuarioRepository usuarioRepository;
	
	public UserDetails buscarPorEmail(String email) {
		Usuario u =	usuarioRepository.findByEmail(email).get(0);
		return u;
	}
	
	public void salvar(Usuario usuario) {
		usuario.setSenha(new BCryptPasswordEncoder().encode(usuario.getSenha()));
		usuarioRepository.save(usuario);
	}
	
	public void alterar(Usuario usuario) {
		Usuario usuarioValidacao = encontrar(usuario.getEmail());
		if(!usuario.getEmail().equals(usuarioValidacao.getEmail())) {
			usuario.setSenha(new BCryptPasswordEncoder().encode(usuario.getSenha()));
		}
		usuarioRepository.save(usuario);
	}
	public List<Usuario> listar() {
		List<Usuario> usuarios = new ArrayList<>();
		usuarioRepository.findAll().forEach(usuario-> usuarios.add(usuario));
		return usuarios;
	}
	public Usuario encontrar(String email) {
		return usuarioRepository.findByEmail(email).get(0);
	}
	public Usuario encontrarCPF(String cpf) {
		return usuarioRepository.findByCpf(cpf).get(0);
	}
	

	public Boolean verificaExistencia(Usuario usuario) {
		Usuario usuarioExiste = usuarioRepository.findByEmail(usuario.getEmail()).get(0);
		if(usuarioExiste !=null)
			if(usuarioExiste.getEmail()!=null)
				if(!usuarioExiste.getEmail().isEmpty())
					return Boolean.TRUE;
		return Boolean.FALSE;
		
	}
}
