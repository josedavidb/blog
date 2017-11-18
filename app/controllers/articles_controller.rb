class ArticlesController < ApplicationController

	before_action :authenticate_user!,except:[:show,:index]
	before_action :set_article, except:[:new,:create,:index]
	def index

		#Va a ser el index de mi paginas de articulos
		#Article.all devuelve un objeto con el que puedo iterar y obtener cada uno
		#de mis articulos
		@arreglo_de_articulos = Article.all

	end

	def show 
		@nuevo_articulo.update_visit_count
		@comment = Comment.new
		#Va a ser la pagina de cada uno de mis articulos
		#puedo obtener mi articulo con Article.find para agregarle estilos
		#@mi_articulo = Article.find(params[:id])
	end

	def new

		#aqui instancio mi articulo nuevo vacio
		#para luego en la vista anadirle propiedades
		@nuevo_articulo = Article.new
	end

	def create

		#Aqui finalmente creo mi articulo propiamente dicho
		#con los datos que mande de post de nuevo_articulo

		@nuevo_articulo = current_user.articles.new(article_params)

		#Aqui guardo finalmente mi articulo en mi tabla de la base de datos

		if @nuevo_articulo.save
			redirect_to @nuevo_articulo

		else
			render :new
		end


		#hago un redireccionamiento a mi la pagina de mi articulo
		
	end

	def destroy
		@nuevo_articulo.destroy
		redirect_to articles_path
	end

	def edit
	end

	def update
		if @nuevo_articulo.update(article_params)
			redirect_to @nuevo_articulo
		else
			render :edit
		end
	end

	#STRONG_PARAM

	private

	def article_params
		params.require(:article).permit(:title,:body)
	end

	def validate_user
		redirect_to new_user_session_path, notice: "Necesitas iniciar sesion"
	end

	def set_article
		@nuevo_articulo = Article.find(params[:id])
	end

end