package doce.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import doce.models.Produto;
import doce.repository.ProdutoRepository;

@Service
public class ProdutoService {
	@Autowired
	ProdutoRepository produtoRepository;

	public void salvar(Produto produto) {
		produtoRepository.save(produto);
	}

	public List<Produto> listar() {
		Iterable<Produto> lista =produtoRepository.findByNomeContainingOrderByPrioridadeDescNomeAsc("%");
		List<Produto> produtos = new ArrayList<Produto>();
		lista.forEach(produto -> produtos.add(produto));
		return  produtos;
	}
	public List<Produto> listarNome(String nome) {
		nome="%"+nome+"%";
		Iterable<Produto> lista =produtoRepository.findByNomeContainingOrderByPrioridadeDescNomeAsc(nome);
		List<Produto> produtos = new ArrayList<Produto>();
		lista.forEach(produto -> produtos.add(produto));
		return  produtos;
	}
	
	public Produto encontrar(Long id) {
		return produtoRepository.findOne(id);
	}
	
	
}
