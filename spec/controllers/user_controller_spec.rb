require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    before {get :new}
    
    it 'レスポンスが200' do
      expect(response).to have_http_status(:ok)
    end
    
    it 'newテンプレートをレンダリングする事' do
      expect(response).to render_template :new
    end
    
    it 'userオブジェクトが渡されてた' do
      expect(assigns(:user)).to be_a_new User
    end
    
  end
  
  describe 'POST #create' do
    context '正しいユーザーが渡ってきた場合'do
      let(:params)do
        {user: {
          name: 'user',
          email: 'email@e.e',
          password: 'password',
          password_confirmation: 'password'
          }
        }
      end
      it 'ユーザーが増えてる'do
        expect{post :create, params: params}.to change(User, :count).by(1)
      end
    end
  end
    
end
