require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "pending..." do
    user = FactoryBot.create(:user)

    visit root_path
    click_link "Login"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "ログイン"
  end
end