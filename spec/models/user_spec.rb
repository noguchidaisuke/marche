require 'rails_helper'

RSpec.describe User, type: :model do
  before 'factory bot'do
    @user = FactoryBot.create(:user)
  end
  it 'is factory confirmation' do
    expect(@user.name).to include('テストユーザー')
  end
  it 'is uniqueness with email' do
    user = FactoryBot.build(:user,email: "test2@gmail.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
  it 'is too long' do
    user = FactoryBot.build(:user,:long)
    user.valid?
    expect(user.errors[:name]).to include('は10文字以内で入力してください')
  end
end
