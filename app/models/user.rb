class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :confirmed_friendships,
           -> { where status: true }, foreign_key: 'requester_id', class_name: 'Friendship'
  has_many :confirmed_friends, through: :confirmed_friendships, source: :receiver

  has_many :pending_requested_friendships,
           -> { where status: false }, foreign_key: 'requester_id', class_name: 'Friendship'
  has_many :pending_requested_friends, through: :pending_requested_friendships, source: :receiver

  has_many :pending_received_friendships,
           -> { where status: false }, foreign_key: 'receiver_id', class_name: 'Friendship'
  has_many :pending_received_friends, through: :pending_received_friendships, source: :requester
end
