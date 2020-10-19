require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      u = User.new
      expect(u).to be_a(Object)
    end

    it 'assigns the values passed' do
      u = User.new({ name: 'derpus' })
      expect(u.name).to eql('derpus')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      u = User.new
      expect(u.valid?).to be_falsy
    end
    
    it 'validates the object to have proper attributes to be valid' do
      u = User.new({ name: 'El_derpo', email: 'el_derpo@email.com', password: '123456' })
      expect(u.valid?).to be_truthy
    end

    it 'validates email uniqueness' do
      x = User.new({ name: 'El_derpo', email: 'el_derpo@email.com', password: '123456' })
      x.save
      u = User.new({ name: 'El_herpo', email: 'el_derpo@email.com', password: '123456' })
      expect(u.valid?).to be_falsy
    end

    it 'validates the name is no more than 20 characters' do
      u = User.new({ name: 'El_derpodddssspppeeeccc', email: 'el_derpo@email.com', password: '123456' })
      expect(u.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'has many posts' do
      u = User.new
      expect(u.posts).to be_a(Object)
    end

    it 'has many comments' do
      u = User.new
      expect(u.comments).to be_a(Object)
    end

    it 'has many likes' do
      u = User.new
      expect(u.likes).to be_a(Object)
    end

    it 'has many dislikes' do
      u = User.new
      expect(u.dislikes).to be_a(Object)
    end

    it 'has many friend requests' do
      u = User.new
      expect(u.friends_requested).to be_a(Object)
    end

    it 'has many friend receipts' do
      u = User.new
      expect(u.friends_received).to be_a(Object)
    end
  end
end
