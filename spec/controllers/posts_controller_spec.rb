require 'rails_helper'

RSpec.describe PostsController do
  describe 'GET index' do
    it 'assigns @post' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      u.save
      sign_in(u)
      get :index
      expect(assigns(:post)).to be_a(Object)
      expect(assigns(:post).content).to eq(nil)
    end

    it 'assigns @timeline_posts' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      u.save
      sign_in(u)
      p = Post.new({ user_id: u.id, content: 'post content' })
      p.save
      get :index
      expect(assigns(:timeline_posts)).to be_a(Object)
      expect(assigns(:timeline_posts).count).to eq(1)
    end

    it 'renders the index template' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      sign_in(u)
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST create' do
    it 'assigns @post' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      u.save
      sign_in(u)
      post :create, { params: { post: { content: 'hello' } } }
      expect(assigns(:post).user_id).to eq(u.id)
    end

    it 'redirects to posts index' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      sign_in(u)
      post :create, { params: { post: { content: 'hello' } } }
      expect(response).to redirect_to(posts_path)
    end
  end
end
