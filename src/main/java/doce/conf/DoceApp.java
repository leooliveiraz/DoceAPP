package doce.conf;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import doce.service.ProdutoService;
import doce.controller.HomeController;
import doce.infra.FileSaver;
import doce.models.Produto;
import doce.repository.ProdutoRepository;

@SpringBootApplication
@ComponentScan(basePackageClasses= {HomeController.class,Configuracoes.class,ProdutoService.class,FileSaver.class})
@EnableJpaRepositories(basePackageClasses= {ProdutoRepository.class})
@EntityScan(basePackageClasses= {Produto.class})
public class DoceApp {
	public static void main(String []args) {
		SpringApplication.run(DoceApp.class,args);
	}

}
