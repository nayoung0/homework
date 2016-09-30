class HomeController < ApplicationController
  # before_action :set_post, only: [:index]

  def index
    if user_signed_in?
      @posts = Post.all.order(created_at: :desc) # reverse로 해도 댐
      @post= Post.new
      @friends = current_user.friends
      @requested = current_user.requested_friends
      @pending = current_user.pending_friends
      @blocked = current_user.blocked_friends
      # @writer = current_user.id.find(params[:id])
      #@user = User.find(params[:user_id])
      # @todo_list = current_user.todo_lists.find(params[:todo_list_id])
      # @nickname = @friends.find(params[:user_id])
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
  #   @posts = current_user.posts.find(params[:id])
  # end
  
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :range)
  end
  
  
end
