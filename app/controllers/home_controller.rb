class HomeController < ApplicationController
  # before_action :set_post, only: [:index]

  def index
    if user_signed_in?
      @posts = Post.all.order(created_at: :desc)
      @post= Post.new
      @friends = current_user.friends
      @requested = current_user.requested_friends
    else
      redirect_to '/users/sign_in'
    end
  end
  
  def create
    @post= Post.new(post_params)
    # @post.title = params[:title]
    # @post.content = params[:content]
    @post.save
    redirect_to '/home/index'
  end
  

  private
  
  # def set_post
  #     @posts = current_user.posts.find(params[:id])
  # end
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
  
  
end
