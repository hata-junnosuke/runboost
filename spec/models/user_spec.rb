# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
     expect(FactoryBot.build(:user)).to be_valid
  end

  # 名がなければ無効な状態であること
  it "is invalid without username" do
      user = FactoryBot.build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include("を入力してください")
  end

  # メールアドレスがなければ無効な状態であること
  it 'is invalid without an email address' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include('が入力されていません。')
  end

  # パスワードがなければ無効な状態であること
  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("が入力されていません。")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("は既に使用されています。")
  end
end