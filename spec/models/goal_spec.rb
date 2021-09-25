require 'rails_helper'

RSpec.describe Goal, type: :model do

  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(FactoryBot.build(:goal)).to be_valid
  end

end
