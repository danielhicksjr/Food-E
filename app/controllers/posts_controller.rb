class PostsController < ApplicationController
  before_action :authorize_post_view, only: :show 
  
  def create
      @post = current_user.posts.new post_params
      @post.save
      redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy 
    redirect_to users_path
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
  redirect_to root_path
  end
end

private
    def post_params
      return params.require(:post).permit(:image, :body, :title)
    end
  end
