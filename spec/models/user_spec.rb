require 'rails_helper'

RSpec.describe User, type: :model do

  describe "name length" do
    let(:user) { FactoryBot.build(:user, name: nil)}

    context "when 2 charactors" do
      it "is too short" do
        user.name = "aa"
        user.valid?
        expect(user.errors[:name]).to include("は3文字以上で入力してください")
      end
    end
    context "when 11 charactors" do
      it "is too long" do
        user.name = "12345678900"
        user.valid?
        expect(user.errors[:name]).to include("は10文字以内で入力してください")
      end
    end
    context "when 8 charactors" do
      it "is confort" do
        user.name = "12345678"
        expect(user).to be_valid
      end
    end
  end

  describe "presence test" do
    it "is invalid without name" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "is invalid without email" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without passoword" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  end

  it "is duplicate email address" do
    FactoryBot.create(:user,email:"test@ex.com")
    user = FactoryBot.build(:user,email:"test@ex.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  describe "password length" do
    let(:user){ FactoryBot.build(:user, password: nil)}
    context "when 3 charactors" do
      it "is too short" do
        user.password = "abc"
        user.valid?
        expect(user.errors[:password]).to include("は4文字以上で入力してください")
      end
    end

    context "when 5 charactors" do
      it "is confort" do
        user.password = "abcde"
        expect(user).to be_valid
      end
    end
  end
end
