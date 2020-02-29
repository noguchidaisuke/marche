require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe do
    before do
      @restaurant = Restaurant.new(
        name: "お店"
      )
    end
    context "don't exist g_id" do
      it "is invalid without g_id" do
        expect(@restaurant).not_to be_valid
      end
    end
    context "exist g_id" do
      it "is valid" do
        @restaurant.g_id = "a12"
        expect(@restaurant).to be_valid
      end
    end
  end
end
