class BlogArquivosController < ApplicationController
  before_action :set_blog
  before_action :set_blog_arquivo, only: [ :destroy ]

  # Ação para criar um novo arquivo de imagem
  def create
    @blog_arquivo = @blog.blog_arquivos.new(blog_arquivo_params)

    if @blog_arquivo.save
      redirect_to blogs_path, notice: "Arquivo de imagem adicionado com sucesso."
    else
      redirect_to blogs_path, alert: "Erro ao adicionar arquivo."
    end
  end

  # Ação para excluir um arquivo de imagem
  def destroy
    @blog_arquivo.destroy
    redirect_to @blog, notice: "Arquivo de imagem excluído com sucesso."
  end

  private

  # Define o blog relacionado com o arquivo
  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  # Define o arquivo de imagem a ser excluído
  def set_blog_arquivo
    @blog_arquivo = @blog.blog_arquivos.find(params[:id])
  end

  # Permite apenas os parâmetros seguros para o blog_arquivo
  def blog_arquivo_params
    params.require(:blog_arquivo).permit(:titulo, :descricao, :imagens [])
  end
end
