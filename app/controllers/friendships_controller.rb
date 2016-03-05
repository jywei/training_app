class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    friend = User.find(params[:friend_id])
    Friendship.create(friendship_params.merge!(friend_id: params[:friend_id], user_id: current_user.id)) unless current_user.follows_or_same?(friend)

    if friend.save
      flash[:success] = "You have successfully followed #{friend.first_name}"
    else
      flash[:danger] = "You have failed to follow #{friend.full_name}"
    end
    redirect_to root_path
  end

  def show
    @friend = Friendship.find(params[:id]).friend
    @friends = current_user.friends
    @exercises = @friend.exercises.all
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if @friendship.destroy
      flash[:success] = "#{@friendship.friend.full_name} is unfollowed"
    else
      flash[:danger] = "#{@friendship.friend.full_name} could not be unfollowed"
    end
    redirect_to user_exercises_path(current_user)
  end

  private

  def friendship_params
    params.permit(:friend_id, :user_id)
  end

end
