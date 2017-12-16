$("#imagem_principal").on('change', function () {
 
    if (typeof (FileReader) != "undefined") {
 
        var image_holder = $("#image-holder");
        image_holder.empty();
 
        var reader = new FileReader();
        reader.onload = function (e) {
            $("<img />", {
                "src": e.target.result,
                "class": "img_produto_cadastro thumb-image"
            }).appendTo(image_holder);
            $("<input />", {
            	"type" : "hidden",
            	"name" : "imagem",
            	"id" : "imagem",
                "value": e.target.result
            }).appendTo(image_holder);
        }
        image_holder.show();
        reader.readAsDataURL($(this)[0].files[0]);
    } else{
        alert("Este navegador nao suporta FileReader.");
    }
});