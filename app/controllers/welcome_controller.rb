class WelcomeController < ApplicationController
  def index
  	@arreglo_de_articulos = Article.all
  	@mitad = @arreglo_de_articulos[0,@arreglo_de_articulos.length/2+1]
  	@mitad2 = @arreglo_de_articulos[@arreglo_de_articulos.length/2,@arreglo_de_articulos.length+1]
  end
end
