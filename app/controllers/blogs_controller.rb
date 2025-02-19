class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @blog_arquivos = @blog.blog_arquivos
  end


  def new
    @blog = Blog.new
    @blog.blog_arquivos.build
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path
    else
      flash[:notice] = "erro"
      render 'blogs/index'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)
      redirect_to blogs_path(@blog)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog_arquivos = @blog.blog_arquivos

    if @blog.destroy
      redirect_to blogs_path
    else
      redirect_to blog_path(@blog)
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:titulo, :descricao, blog_aquivos_attributes: [:id, :titulo, :descricao, :imagem, :_destroy])
  end

end
