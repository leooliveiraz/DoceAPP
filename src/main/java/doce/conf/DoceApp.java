package doce.conf;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import doce.controller.HomeController;

@SpringBootApplication
@ComponentScan(basePackageClasses= {HomeController.class,Configuracoes.class})
public class DoceApp {
	public static void main(String []args) {
		SpringApplication.run(DoceApp.class,args);
	}

}
