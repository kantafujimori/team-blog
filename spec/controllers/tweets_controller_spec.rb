require 'rails_helper'

describe TweetsController do
  let(:user) { create(:user) }

  describe '#new' do
    context 'log in' do
      it 'assigns @tweet' do
        login user
        get :new
        expect(assigns(:tweet)).to be_a_new(Tweet)
      end

      it 'renders new' do
        login user
        get :new
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      it 'redirects to new_user_session_path' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#create' do
    let(:user){ create(:user) }
    let(:params){ { user_id: user.id, tweet: attributes_for(:tweet) } }
    before do
      login user
    end

    context 'can save' do
       subject {
      post :create,
      params: params
      }
        it 'count up tweet' do
          expect{ subject }.to change(Tweet, :count).by(1)
        end

        it 'redirects to root_path' do
          subject
          expect(response).to redirect_to(root_path)
        end
    end

    context 'can not save' do
      let(:invalid_params) { { user_id: user.id, tweet: attributes_for(:tweet, text: nil, image: nil ) } }
      subject {
        post :create,
        params: invalid_params
      }

        it 'does not count up tweet' do
          expect{ subject }.not_to change(Tweet, :count)
        end

        it 'renders root_path' do
          subject
          expect(response).to redirect_to(root_path)
        end
    end
  end

  # describe 'delete #destroy' do
  #   let(:user){ create(:user) }
  #   let(:tweet){ create(:tweet, user: user) }
  #   subject {
  #     delete :destroy,
  #     params: { id: tweet.id }
  #   }

  #     context 'can destory' do
  #       before do
  #       login user
  #       end

  #       it 'deletes the tweet' do
  #         expect{ subject }.to change(Tweet, :count).by(-1)
  #       end

  #       it 'redirect_to root_path' do
  #         subject
  #         expect(response).to redirect_to(root_path)
  #       end
  #     end

  #     context 'can not delete' do
  #       let(:other_user){ create(:user) }
  #       before do
  #         login other_user
  #       end

  #         it 'not deletes the tweet' do
  #           expect{ subject }.not_to change(Tweet, :count)
  #         end
  #     end
  # end
end


