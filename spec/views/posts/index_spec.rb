require 'rails_helper'
RSpec.describe 'posts/index', type: :view do
  describe 'Posts index template' do
    it 'renders the posts list' do
      u = User.create!({ name: 'Name 1', email: 'email1@email.com', password: '123456' })
      sign_in(u)
      p = Post.new({user_id: u.id, content: "post content"})
      p.save
      assign(:post, Post.new)
      assign(:timeline_posts, p)
      render
      expect(rendered).to match(/Post/)
    end
  end
end