class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.belongs_to :requester
      t.belongs_to :receiver
      t.boolean :status

      t.timestamps
    end
  end
end
