class PostsController < ApplicationController
  before_action :set_post, only: [:update, :edit, :show, :destroy]
  
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = @post(post_params)
    @post.save
    redirect_to @posts
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id]) 
  end

  def post_params
    params.require(:article).permit(:title, :description)
  end
end
