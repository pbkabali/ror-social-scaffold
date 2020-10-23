require 'rails_helper'

RSpec.describe FriendshipsController do
  describe 'GET index' do
    it 'assigns @users' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      u.save
      sign_in(u)
      get :index
      expect(assigns(:users)).to be_a(Object)
      expect(assigns(:users)).to eq([])
    end

    it 'renders the index template' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      sign_in(u)
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST create' do
    it 'assigns @friendship' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      u.save
      sign_in(u)
      controller.request.headers.merge({ 'HTTP_REFERER': friendships_path })
      post :create, params: { id: 1 }
      expect(assigns(:friendship).requester_id).to eq(u.id)
    end
  end

  describe 'PATCH update' do
    it 'assigns @friendship' do
      u = User.create!({ name: 'Name', email: 'email@email.com', password: '123456' })
      u2 = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      Friendship.create!({ requester_id: u2.id, receiver_id: u.id, status: false })
      sign_in(u)
      controller.request.headers.merge({ 'HTTP_REFERER': friendships_path })
      patch :update, params: { id: u2.id }
      expect(assigns(:friendship).receiver_id).to eq(u.id)
    end
  end

  describe ' DELETE destroy' do
    it 'assigns @friendship' do
      u = User.create!({ name: 'Name', email: 'email@email.com', password: '123456' })
      u2 = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      Friendship.create!({ requester_id: u2.id, receiver_id: u.id, status: false })
      sign_in(u)
      controller.request.headers.merge({ 'HTTP_REFERER': friendships_path })
      delete :destroy, params: { id: u2.id }
      expect(assigns(:friendship).receiver_id).to eq(u.id)
    end
  end
end
