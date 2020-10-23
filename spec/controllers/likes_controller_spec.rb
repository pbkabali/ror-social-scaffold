require 'rails_helper'

RSpec.describe LikesController do
  describe 'POST create' do
    it 'assigns @like' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      u.save
      p = Post.create({ user_id: u.id, content: 'henlo' })
      sign_in(u)
      post :create, { params: { post_id: p.id } }
      expect(assigns(:like).post_id).to eq(p.id)
    end

    it 'redirects to posts index' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      u.save
      p = Post.create({ user_id: u.id, content: 'henlo' })
      sign_in(u)
      post :create, { params: { post_id: p.id } }
      expect(response).to redirect_to(posts_path)
    end
  end

  describe 'DELETE destroy' do
    it 'redirects to post index' do
      u = User.create!({ name: 'Name', email: 'email@email.com', password: '123456' })
      sign_in(u)
      post = Post.create!({ user_id: u.id, content: 'henlo' })
      l = Like.new({ post_id: post.id, user_id: u.id })
      l.save
      delete :destroy, params: { id: l.id, user_id: u.id, post_id: post.id }
      expect(response).to redirect_to(posts_path)
    end
  end
end
