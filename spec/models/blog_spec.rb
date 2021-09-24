require 'rails_helper'

RSpec.describe Blog, type: :model do

  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(FactoryBot.build(:blog)).to be_valid
  end

  # contentの入力がなければ無効な状態であること
  it "is invalid without content" do
    blog = FactoryBot.build(:blog, content: nil)
    blog.valid?
    expect(blog.errors[:content]).to include("を入力してください")
  end
end
