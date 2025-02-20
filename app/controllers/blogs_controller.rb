class BlogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by(id: params[:id])

    if @blog.present?
      redirect_to blog_path(@blog)
    else
      redirect_to blogs_path, alert: "Blog não encontrado."
    end
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
      redirect_to blogs_path
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

    @blog.blog_arquivos.destroy_all

    if @blog.destroy
      redirect_to blogs_path
    else
      redirect_to blog_path(@blog)
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:titulo, :descricao, blog_arquivos_attributes: [:id, :titulo, :descricao,{ imagem:[]}, :_destroy])
  end

end
