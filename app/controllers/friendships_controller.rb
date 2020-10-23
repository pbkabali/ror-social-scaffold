class FriendshipsController < ApplicationController
  def index
    @users = current_user.pending_received_friends
  end

  def create
    @friendship = current_user.friends_requested.build(receiver_id: params[:id], status: false)

    if @friendship.save
      redirect_to request.referrer, alert: 'Friendship request successfully sent.'
    else
      redirect_to request.referrer, alert: 'Friendship request NOT sent.'
    end
  end

  def update
    @friendship = current_user.friends_received.pending.find_by(requester_id: params[:id])
    @friendship.status = true
    if @friendship.save
      redirect_to request.referrer, alert: 'Friendship accepted successfully.'
    else
      redirect_to request.referrer, alert: 'Friendship NOT accepted!.'
    end
  end

  def destroy
    @friendship = current_user.friends_received.pending.find_by(requester_id: params[:id])
    if @friendship.destroy
      redirect_to request.referrer, alert: 'Friendship rejected successfully.'
    else
      redirect_to request.referrer, alert: 'Friendship NOT rejected!.'
    end
  end
end
