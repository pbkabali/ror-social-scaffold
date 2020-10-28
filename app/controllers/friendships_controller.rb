class FriendshipsController < ApplicationController
  def index
    @users = current_user.pending_received_friends
  end

  def create
    @friendship = current_user.pending_requested_friendships.build(receiver_id: params[:id])
    if @friendship.save
      redirect_to request.referrer, alert: 'Friendship request successfully sent.'
    else
      redirect_to request.referrer, alert: 'Friendship request NOT sent.'
    end
  end

  def update
    @friendship1 = current_user.pending_received_friendships.find_by(requester_id: params[:id])
    @friendship1.status = true
    @friendship2 = Friendship.new(requester_id: current_user.id, receiver_id: params[:id], status: true)

    if @friendship1.save && @friendship2.save
      redirect_to request.referrer, alert: 'Friendship accepted successfully.'
    else
      redirect_to request.referrer, alert: 'Friendship NOT accepted!.'
    end
  end

  def destroy
    @friendship = current_user.pending_received_friendships.find_by(requester_id: params[:id])
    if @friendship.destroy
      redirect_to request.referrer, alert: 'Friendship rejected successfully.'
    else
      redirect_to request.referrer, alert: 'Friendship NOT rejected!.'
    end
  end
end
