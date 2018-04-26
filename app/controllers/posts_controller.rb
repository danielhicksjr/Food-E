class PostsController < ApplicationController
  before_action :authorize_post_view, only: [:edit, :update, :destroy]
  
  def create
      @post = current_user.posts.new post_params
      @post.save
      redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy 
    flash[:success] = "Post deleted successfully."
    redirect_to posts_path
  end
  

  def edit
    @post = Post.find(params[:id]) 
  end

  def index
    @posts = Post.all
  end
  
  def new
   @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
   end

  def update
    @post = Post.find params[:id]
    @post.image = params[:post][:image]
    @post.body = params[:post][:body]
    @post.title = params[:post][:title]
    if @post.save
      redirect_to root_path
    end
  end


  def authorize_post_view 
    @post = Post.find params[:id]
    if  @post.user_id != current_user.id
    redirect_to post_path
    end
  end

private
    def post_params
      return params.require(:post).permit(:image, :body, :title)
    end
  end
  
