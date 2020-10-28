require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      f = Friendship.new
      expect(f).to be_a(Object)
    end
  end

  context 'Attribute validations' do
    it 'validates friendship without users to be invalid' do
      f = Friendship.new
      expect(f.valid?).to be_falsy
    end
  end

  context 'Association tests' do
    it 'associates a receiver and a requester' do
      u1 = User.new({ name: 'El_derpo', email: 'el_derpo@email.com', password: '123456' })
      u1.save
      u2 = User.new({ name: 'El_herpo', email: 'el_herpo@email.com', password: '123456' })
      u2.save
      f = Friendship.new({ requester_id: u1.id, receiver_id: u2.id })
      expect(f.requester).to eql(u1)
      expect(f.receiver).to eql(u2)
    end
  end
end
