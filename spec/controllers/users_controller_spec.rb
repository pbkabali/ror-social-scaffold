require 'rails_helper'

RSpec.describe UsersController do
  describe 'GET index' do
    it 'assigns @users' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      u.save
      sign_in(u)
      get :index
      expect(assigns(:users)).to be_a(Object)
      expect(assigns(:users)).to eq([u])
      expect(assigns(:users).count).to eq(1)
    end

    it 'renders the index template' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      sign_in(u)
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'assigns @user' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      u.save
      sign_in(u)
      get :show, { params: { id: u.id } }
      expect(assigns(:user)).to be_a(Object)
      expect(assigns(:user)).to eq(u)
    end

    it 'assigns @posts' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      u.save
      sign_in(u)
      get :show, { params: { id: u.id } }
      expect(assigns(:posts)).to be_a(Object)
      expect(assigns(:posts)).to eq([])
    end

    it 'renders the show template' do
      u = User.create!({ name: 'Name 2', email: 'email2@email.com', password: '123456' })
      u.save
      sign_in(u)
      get :show, { params: { id: u.id } }
      expect(response).to render_template('show')
    end
  end
end
