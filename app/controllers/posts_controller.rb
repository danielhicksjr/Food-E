class PostsController < ApplicationController
  before_action :authorize_post_view, only: :show 
  
  def create
      @post = current_user.posts.new post_params
      @post.save
      redirect_to post_path(@post.id)
  end

  def destroy
  end

  def edit
  end

  def index
    # @post = current_user.posts.new
    @posts = Post.all
    
  end

  def new
   @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    

  end

  def update
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
  