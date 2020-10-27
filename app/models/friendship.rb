class Friendship < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validate :cannot_add_self

  private

  def cannot_add_self
    errors.add(:receiver_id, 'You cannot add yourself as a friend.') if receiver_id == requester_id
  end
end
