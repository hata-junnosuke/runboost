require 'rails_helper'

RSpec.describe Goal, type: :model do
  it '有効なファクトリを持つこと' do
    expect(FactoryBot.create(:goal)).to be_valid
  end
end
