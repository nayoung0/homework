class FriendsController < ApplicationController

  def index
    @friends = current_user.friends                 #all friends
    @requested = current_user.requested_friends     #requested friends
    @users= User.all                                #all users
    @user = User.search(params[:search])            #friend i want to be with
    @friend = User.find_by_nickname(params[:friend])#current friend
  end
  
  def f_request
    @friend = User.find_by_nickname(params[:friend])
    current_user.friend_request(@friend)
    redirect_to "/home/index"
  end
  
  def f_accept
    @friend = User.find_by_nickname(params[:friend])
    current_user.accept_request(@friend)
    redirect_to :back
  end
  
  def f_decline
    @friend=User.find_by_nickname(params[:friend])
    current_user.decline_request(@friend)
    redirect_to :back
  end
  
  def f_block
    @friend=User.find_by_nickname(params[:friend])
    current_user.block_friend(@friend)
    redirect_to :back  
  end

  def f_unblock
    @friend=User.find_by_nickname(params[:friend])
    current_user.unblock_friend(@friend)
    redirect_to :back  
  end
  
end
