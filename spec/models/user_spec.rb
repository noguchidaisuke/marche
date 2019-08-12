require 'rails_helper'

RSpec.describe User, type: :model do
  describe'#age' do
    before do
      allow(Time.zone).to receive(:now).and_return(Time.zone.parse('2018/04/01'))
    end
    
    context '20年前の生年月日の場合' do
      let(:user) { User.new(birthday: Time.zone.now - 20.years) }
      it '年齢が２０歳である事' do
        expect(user.age).to eq 20
      end
    end
    
    context '10年前に生まれた場合でちょうど誕生日' do
      let(:user) { User.new(birthday: Time.zone.parse('2008/04/01')) }
      it '年齢が２０歳である事' do
        expect(user.age).to eq 10
      end
    end
  end
end
