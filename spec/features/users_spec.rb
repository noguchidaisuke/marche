require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "pending..." do
    user = FactoryBot.create(:user,:testuser)
    visit root_path
    click_link "Login"
    click_button "テストログイン"
    save_and_open_page
  end
end