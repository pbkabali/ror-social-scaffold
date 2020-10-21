class FriendshipsController < ApplicationController
  def index
    @friendships = current_user.friends_received.pending
  end
end
