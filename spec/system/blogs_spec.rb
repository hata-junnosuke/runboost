require 'rails_helper'

RSpec.describe "Blogs", type: :system do
  # ユーザーは新しいブログを作成する
  before do
    @user = FactoryBot.create(:user)
  end

  scenario "user creates a new blog" do
    visit new_user_registration_path
    fill_in "", with: @user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    
    expect {
     click_link "記録する"
     fill_in "日時", with: "2021/09/10"
     fill_in "メニュー", with: "朝ラン"
     fill_in "距離", with: "10"
     click_button "記録する"

    expect(page).to have_content "記録しました。"
    expect(page).to have_content "朝ラン"
    expect(page).to have_content "Owner: #{user.name}"
    }.to change(user.blogs, :count).by(1)
  end  
end
