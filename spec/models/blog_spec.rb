require 'rails_helper'

RSpec.describe Blog, type: :model do


  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:blog)).to be_valid
  end

  it "contentの入力がなければ無効な状態であること" do
    blog = FactoryBot.build(:blog, content: nil)
    blog.valid?
    expect(blog.errors[:content]).to include("を入力してください")
  end
end
