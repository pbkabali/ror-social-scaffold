require 'rails_helper'

RSpec.describe 'Sign up page', type: :system do
  describe 'sign up page' do
    it 'shows the sign up page' do
      visit 'users/sign_up'
      expect(page).to have_content('Sign up')
    end
  end
end