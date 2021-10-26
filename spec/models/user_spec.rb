# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it '有効なファクトリを持つこと' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it '名がなければ無効な状態であること' do
    user = FactoryBot.build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include('を入力してください')
  end

  it 'メールアドレスがなければ無効な状態であること' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include('が入力されていません。')
  end

  it 'パスワードがなければ無効な状態であること' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include('が入力されていません。')
  end

  it '重複したメールアドレスなら無効な状態であること' do
    FactoryBot.create(:user, email: 'aaron@example.com')
    user = FactoryBot.build(:user, email: 'aaron@example.com')
    user.valid?
    expect(user.errors[:email]).to include('は既に使用されています。')
  end
end
