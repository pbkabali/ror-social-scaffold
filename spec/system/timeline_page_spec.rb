require 'rails_helper'

RSpec.describe 'Timeline page', type: :system do
  describe 'user timeline page' do
    it 'shows error message if user is not signed in' do
      visit posts_path(1)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end