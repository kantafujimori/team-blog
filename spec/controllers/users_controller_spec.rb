require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }

  describe '#show' do
    it 'assigns @tweets' do
      get :show, params: { id: user.id }
      tweets = create_list(:tweet, 3, user: user)
      expect(assigns(:tweets)).to match(tweets.sort{|a, b| b.id <=> a.id })
    end

    it 'renders the :index template' do
      get :show, params: { id: user.id }
      expect(response).to render_template :show
    end
  end
end
