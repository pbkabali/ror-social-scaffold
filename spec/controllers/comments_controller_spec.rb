require 'rails_helper'

RSpec.describe CommentsController do
  describe 'POST create' do
    it 'assigns @comment' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      sign_in(u)
      p = Post.create({ user_id: u.id, content: 'henlo' })
      post :create, params: { comment: { content: 'henlo' }, post_id: p.id }
      expect(assigns(:comment).post_id).to eq(p.id)
    end

    it 'redirects to posts index' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      sign_in(u)
      p = Post.create({ user_id: u.id, content: 'henlo' })
      post :create, params: { comment: { content: 'henlo' }, post_id: p.id }
      expect(response).to redirect_to(posts_path)
    end
  end
end
