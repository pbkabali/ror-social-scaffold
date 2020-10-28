require 'rails_helper'
# features/support/warden.rb

RSpec.describe 'users/show', type: :view do
  describe 'User show template' do
    it 'renders the user page' do
      u = User.create!({ name: 'Name 1', email: 'email1@email.com', password: '123456' })
      sign_in(u)
      assign(:user, u)
      assign(:posts, u.posts)
      render
      expect(rendered).to match(u.name.to_s)
    end
  end
end
