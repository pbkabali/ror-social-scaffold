require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      p = Post.new
      expect(p).to be_a(Object)
    end

    it 'assigns the values passed' do
      p = Post.new({ content: 'My crazy post' })
      expect(p.content).to eql('My crazy post')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      p = Post.new
      expect(p.valid?).to be_falsy
    end

    it 'validates the object to have proper attributes to be valid' do
      u = User.new({ name: 'El_derpo', email: 'el_derpo@email.com', password: '123456' })
      u.save
      p = Post.new({ content: 'My nice post', user_id: u.id })
      expect(p.valid?).to be_truthy
    end

    it 'validates content presence' do
      u = User.new({ name: 'El_derpo', email: 'el_derpo@email.com', password: '123456' })
      u.save
      p = Post.new({ user_id: u.id })
      expect(p.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'belongs to a user' do
      p = Post.new
      expect(p.user).to be_a(Object)
    end

    it 'has many comments' do
      p = Post.new
      expect(p.comments).to be_a(Object)
    end

    it 'has many likes' do
      p = Post.new
      expect(p.likes).to be_a(Object)
    end

    it 'has many dislikes' do
      p = Post.new
      expect(p.dislikes).to be_a(Object)
    end
  end
end
