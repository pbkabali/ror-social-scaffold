class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :friends_requested, foreign_key: 'requester_id', class_name: 'Friendship', dependent: :destroy
  has_many :friends_received, foreign_key: 'receiver_id', class_name: 'Friendship', dependent: :destroy

  def pending_requested_friends
    friends_array = friends_requested.map{|friendship| friendship.receiver unless friendship.status}
    friends_array.compact
  end

  def pending_received_friends
    friends_array = friends_received.map{|friendship| friendship.requester unless friendship.status}
    friends_array.compact
  end

  def confirmed_friends
    friends_array = friends_requested.map{|friendship| friendship.receiver if friendship.status}
    friends_array += friends_received.map{|friendship| friendship.requester if friendship.status}
    friends_array.compact
  end

end
