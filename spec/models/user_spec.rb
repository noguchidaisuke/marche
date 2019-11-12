require 'rails_helper'

RSpec.describe User, type: :model do
  before 'factory bot'do
    @user = FactoryBot.create(:user)
  end
  describe 'validation check' do
    it 'is uniqueness with email' do
      user = FactoryBot.build(:user,email: "test3@gmail.com")
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end
    it 'is too long' do
      user = FactoryBot.build(:user,:long)
      user.valid?
      expect(user.errors[:name]).to include('は10文字以内で入力してください')
    end
  end
  
  it 'can login' do
    expect(@user.authenticate(@user.password)).to be_truthy
  end
end
