require 'rails_helper'

RSpec.describe Dislike, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      dislike = Dislike.new
      expect(dislike).to be_a(Object)
    end
  end

  context 'Testing validations' do
    it 'validates object to have attributes' do
      dislike = Dislike.new
      expect(dislike.valid?).to to be_falsy
    end

    it 'validates the user_id to be unique' do
      u = User.new({ name: 'El_derpo', email: 'el_derpo@email.com', password: '123456' })
      u.save
      p = Post.new({ content: 'My nice post', user_id: u.id })
      p.save
      dislike = Dislike.new({ user_id: u.id, post_id: p.id })
      expect(dislike.valid?).to be_truthy
    end

    it 'validates the user_id to be unique' do
      u = User.new({ name: 'El_derpo', email: 'el_derpo@email.com', password: '123456' })
      u.save
      p = Post.new({ content: 'My nice post', user_id: u.id })
      p.save
      dislike = Dislike.new({ user_id: u.id, post_id: p.id })
      dislike.save
      dislike = Dislike.new({ user_id: u.id, post_id: p.id })
      expect(dislike.valid?).to be_falsy
    end
    
  end

  context 'Testing associations' do
    it 'belongs to a user' do
      dislike = Dislike.new
      expect(dislike.user).to be_a(Object)
    end

    it 'belongs to a post' do
      dislike = Dislike.new
      expect(dislike.post).to be_a(Object)
    end
  end
end

