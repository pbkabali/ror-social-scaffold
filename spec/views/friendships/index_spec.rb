require 'rails_helper'
RSpec.describe 'friendships/index', type: :view do
  describe 'Friendship index template' do
    it 'renders the friendships list' do
      u2 = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      users = u2.pending_received_friends
      sign_in(u2)
      assign(:users, users)
      render
      expect(rendered).to match(/Requests/)
    end
  end
end