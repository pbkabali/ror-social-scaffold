class Friendship < ApplicationRecord
  scope :pending, -> { where('status = ?', false) }

  belongs_to :requester, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
end
