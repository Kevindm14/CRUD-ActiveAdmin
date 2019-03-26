class PostsController < ApplicationController
  before_action :set_post, only: [:update, :edit, :show, :destroy]
  
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @posts = Post.all
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :index
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id]) 
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
