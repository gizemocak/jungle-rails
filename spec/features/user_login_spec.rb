require 'rails_helper'

RSpec.feature "Users navigate from the home page to the product datail", type: :feature, js: true do

  scenario "user can login successfully" do
    @user = User.create!(
      first_name: 'gizem',
      last_name: 'ocak',
      email: 'gizem_ocak@outlook.com',
      password: '12345'
    )
   
    visit root_path
    click_on 'Login'
    sleep(1)
    fill_in "email", with: "gizem_ocak@outlook.com"
    fill_in "password", with: "12345"
    find('section .btn').click
    save_screenshot
    expect(page).to have_content 'Logout'
  end

end
