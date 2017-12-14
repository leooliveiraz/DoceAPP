<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Doce App">

	<div id="demo" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>

		<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="img_carousel"
						src="https://img.stpu.com.br/?img=https://s3.amazonaws.com/pu-mgr/default/a0RG000000jYz8kMAC/5a1c68bee4b0b11dc316d6a6.jpg&w=620&h=400"
						alt="Los Angeles">
				</div>
				<div class="carousel-item">
					<img class="img_carousel"
						src="https://img.elo7.com.br/product/original/1B66FFE/panetone-trufados-panetonetrufado-chocotonetrufado-panetone-chocotone-natal-chocolate-presente-delic.jpg"
						alt="Los Angeles" >
				</div>
				<div class="carousel-item">
					<img class="img_carousel"
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbScegp5XGC02ZoStNz41Hrf6nA3wFO3xZp1oIokK5XzvohIjv"
						alt="Los Angeles" >
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>

		</div>

</tags:pageTemplate>