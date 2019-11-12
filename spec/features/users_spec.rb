require 'rails_helper'

RSpec.feature "users", type: :feature do
    scenario "login confirmation" do
      user = FactoryBot.create(:user)
      visit root_path
      click_link "ログイン"
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      click_button "ログイン"

      expect(page).to have_content "ランキング"
    end
end
