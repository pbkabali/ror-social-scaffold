require 'rails_helper'

RSpec.describe 'Sign in page', type: :system do
  describe 'sign in page' do
    it 'shows the sign in page' do
      visit 'users/sign_in'
      expect(page).to have_content('Sign in')
    end
  end
end
