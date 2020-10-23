require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      c = Comment.new
      expect(c).to be_a(Object)
    end

    it 'assigns the values passed' do
      c = Comment.new({ content: 'My crazy post' })
      expect(c.content).to eql('My crazy post')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      c = Comment.new
      expect(c.valid?).to be_falsy
    end

    it 'validates the object to have proper attributes to be valid' do
      u = User.new({ name: 'El_derpo', email: 'el_derpo@email.com', password: '123456' })
      u.save
      p = Post.new({ content: 'My nice post', user_id: u.id })
      p.save
      c = Comment.new({ content: 'post comment here', user_id: u.id, post_id: p.id })
      expect(c.valid?).to be_truthy
    end

    it 'validates content presence' do
      u = User.new({ name: 'El_derpo', email: 'el_derpo@email.com', password: '123456' })
      u.save
      p = Post.new({ content: 'My nice post', user_id: u.id })
      p.save
      c = Comment.new({ user_id: u.id, post_id: p.id })
      expect(c.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'belongs to a user' do
      c = Comment.new
      expect(c.user).to be_a(Object)
    end

    it 'belongs to a post' do
      c = Comment.new
      expect(c.post).to be_a(Object)
    end
  end
end
