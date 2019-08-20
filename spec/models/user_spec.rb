require 'rails_helper'

describe '足し算' do
    it '1+1=' do
        a=1+1
        expect(a).to eq 2
    end
end

describe 'ユーザー作成' do
    it '確かめる' do
        @user = User.new
        expect(@user.save).to be_falsy
    end
end