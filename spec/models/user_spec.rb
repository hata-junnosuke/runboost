require 'rails_helper'

RSpec.describe User, type: :model do
  #メールアドレスがなければ無効な状態であること    
  it "is invalid without an email address" do
     user = User.new(email: nil)
     user.valid?
     expect(user.errors[:email]).to include("が入力されていません。")
  end 
end
