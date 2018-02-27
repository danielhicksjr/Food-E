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
  end

  def new
    @post = current_user.posts.new
    
  end

  def show

    
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
      return params.require(:post).permit(:title, :body)
    end
  end