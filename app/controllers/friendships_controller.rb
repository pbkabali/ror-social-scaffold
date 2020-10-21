class FriendshipsController < ApplicationController
  def index
    @friendships = current_user.friends_received.pending
  end

  def create
    @friendship = current_user.friends_requested.build(receiver_id: params[:id], status: false)

    if @friendship.save
      redirect_to users_path, alert: 'Friendship request successfully sent.'
    else
      redirect_to users_path, alert: 'Friendship request NOT sent.'
    end
  end

  def update
    @friendship = current_user.friends_received.pending.find_by(requester_id: params[:id])
    @friendship.status = true
    if @friendship.save
      redirect_to users_path, alert: 'Friendship accepted successfully.'
    else
      redirect_to users_path, alert: 'Friendship NOT accepted!.'
    end
  end

  def destroy
    @friendship = current_user.friends_received.pending.find_by(requester_id: params[:id])
    if @friendship.destroy
      redirect_to users_path, alert: 'Friendship rejected successfully.'
    else
      redirect_to users_path, alert: 'Friendship NOT rejected!.'
    end
  end
end
