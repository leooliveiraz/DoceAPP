package doce.conf;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import doce.controller.HomeController;
import doce.infra.FileSaver;
import doce.models.CarrinhoCompras;
import doce.models.Produto;
import doce.repository.ProdutoRepository;
import doce.service.ProdutoService;

@SpringBootApplication
@ComponentScan(basePackageClasses= {HomeController.class,Configuracoes.class,ProdutoService.class,FileSaver.class,CarrinhoCompras.class})
@EnableJpaRepositories(basePackageClasses= {ProdutoRepository.class})
@EntityScan(basePackageClasses= {Produto.class})
public class DoceApp {
	public static void main(String []args) {
		SpringApplication.run(DoceApp.class,args);
	}
	
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	    resolver.setPrefix("/WEB-INF/views/");
	    resolver.setSuffix(".jsp");
	    resolver.setExposedContextBeanNames("carrinhoCompras");
	    return resolver;
	}

}
