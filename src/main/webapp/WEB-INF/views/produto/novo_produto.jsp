<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Novo Produto">
	<br>
	<br>
	<div class="container ">
		<div class="container-fluid ">
			<h1>Cadastro de Produtos</h1>
			<hr>
			<form:form action="/produtos/salvar" method="post" enctype="multipart/form-data" >
				<div class="form-group row">
					<label for="nome" class="col-sm-2 col-form-label">
						Nome:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="nome" name="nome"
							placeholder="Nome do produto">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="descricao" class="col-sm-2 col-form-label">
						Descrição:
					</label>
					<div class="col-sm-10">
						<textarea class="form-control" id="descricao" rows="3" name="descricao"
							placeholder="Informe a descrição do produto"></textarea>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="valor" class="col-sm-2 col-form-label">
						Valor:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="valor" name="valor"
							placeholder="Valor do produto">
					</div>
				</div>
				
				
				<div class="form-group row">
					<label for="valor_desconto" class="col-sm-2 col-form-label">
						Valor com desconto:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="valor_desconto" name="valor_desconto"
							placeholder="Valor com desconto">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="prioridade" class="col-sm-2 col-form-label">
						É Prioridade:
					</label>
					<div class="col-sm-10">
						<select class="custom-select" name="prioridade">
						  <option value="0">Não</option>
						  <option value="1">Sim</option>
						</select>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="imagem" class="col-sm-2 col-form-label">
						Imagem:
					</label>
					<div class="col-sm-10">		
												
						<div id="image-holder" class="image-holder">
						</div>		
    					<div class="dropzone">
    						<div class="info"></div>
   						</div>
					</div>
				</div>
				
				<br>
				<br>
				<button type="submit" class="btn btn-primary btn-lg btn-block" >Cadastrar</button>
				<button type="reset" class="btn btn-warning btn-lg btn-block">Limpar</button>
			</form:form>
		</div>
	</div>
</tags:pageTemplate>