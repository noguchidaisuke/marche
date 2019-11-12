require 'rails_helper'

RSpec.describe Like, type: :model do
  before 'factory' do
    @user = FactoryBot.create(:user)
    @restaurant=FactoryBot.create(:restaurant)
  end
  it 'can like and unlike method' do
    @user.like(@restaurant)
    expect{@user.unlike(@restaurant)}.to change{Like.count}.by(-1)
  end
end