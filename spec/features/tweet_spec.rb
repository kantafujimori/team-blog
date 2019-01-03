require 'rails_helper'

feature 'tweet', type: :feature do
  let(:user) { create(:user) }

  scenario 'post tweet' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path

    expect {
      click_link('投稿')
      expect(current_path).to eq new_tweet_path
      fill_in 'tweet_text', with: 'テスト'
      find('input[type="submit"]').click
    }.to change(Tweet, :count).by(1)
  end
end
