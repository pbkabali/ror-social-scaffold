require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      like = Like.new
      expect(like).to be_a(Object)
    end
  end

  context 'Testing validations' do
    it 'validates object to have attributes' do
      like = Like.new
      expect(like.valid?).to be_falsy
    end

    it 'validates the user_id to be unique' do
      u = User.new({ name: 'El_derpo', email: 'el_derpo@email.com', password: '123456' })
      u.save
      p = Post.new({ content: 'My nice post', user_id: u.id })
      p.save
      like = Like.new({ user_id: u.id, post_id: p.id })
      expect(like.valid?).to be_truthy
    end

    it 'validates the user_id to be unique' do
      u = User.new({ name: 'El_derpo', email: 'el_derpo@email.com', password: '123456' })
      u.save
      p = Post.new({ content: 'My nice post', user_id: u.id })
      p.save
      like = Like.new({ user_id: u.id, post_id: p.id })
      like.save
      like = Like.new({ user_id: u.id, post_id: p.id })
      expect(like.valid?).to be_falsy
    end
    
  end

  context 'Testing associations' do
    it 'belongs to a user' do
      like = Like.new
      expect(like.user).to be_a(Object)
    end

    it 'belongs to a post' do
      like = Like.new
      expect(like.post).to be_a(Object)
    end
  end
end
