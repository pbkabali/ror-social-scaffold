require 'rails_helper'
RSpec.describe 'users/index', type: :view do
  describe 'User index template' do
    it 'renders the users list' do
      u = User.create!({ name: 'Name 1', email: 'email1@email.com', password: '123456' })
      sign_in(u)
      assign(:users, u)
      render
      expect(rendered).to match('Name')
    end
  end
end
