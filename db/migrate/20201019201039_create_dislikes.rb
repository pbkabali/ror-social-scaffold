class CreateDislikes < ActiveRecord::Migration[5.2]
  def change
    create_table :dislikes do |t|
      t.integer :post_id
      t.integer :user_id
    end
    add_foreign_key :dislikes, :users, column: :user_id
    add_foreign_key :dislikes, :posts, column: :post_id
  end
end
