require 'rails_helper'

RSpec.describe 'Blogs', type: :system do
  # ユーザーは新しいブログを作成する
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ユーザーは新しいブログを作成する' do
    visit new_user_session_path

    fill_in 'sesstion_email', with: @user.email
    fill_in 'sesstion_password', with: @user.password
    click_button 'ログイン'

    expect do
      click_link '記録する', id: 'write'
      fill_in 'content', with: '朝ラン'
      fill_in 'distance', with: '10'
      click_button '記録する'

      expect(page).to have_content '記録しました。'
        .to change(@user.blogs, :count).by(1)
    end
  end
end
