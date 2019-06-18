require 'rails_helper'
RSpec.feature "user clicks to 'add to cart'", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )      
    end
  end

  scenario "user clicks on a product to add it in the cart" do
    visit root_path
    sleep(1)
    save_screenshot

    page.find('.products article:first-child .actions button').click
    sleep(1)
    save_screenshot

    expect(page).to have_content "My Cart (1)"
  end

end