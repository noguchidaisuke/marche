require 'rails_helper'

RSpec.describe User, type: :model do
  it 'factory confirmation' do
    user = FactoryBot.create(:user)
    expect(user.name).to include('テストユーザー')
  end
  it 'is invalid name with too long trait lesson' do
    user = FactoryBot.build(:user,:long)
    user.valid?
    expect(user.errors[:name]).to include("は10文字以内で入力してください")
  end
end
