require 'rails_helper'

RSpec.feature "Users navigate from the home page to the product datail", type: :feature, js: true do

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

  # scenario "They see all products(go to homepage)" do
  #   # ACT
  #   visit root_path
  #   save_screenshot
  #   sleep(1)
  #   save_and_open_screenshot
  #   expect(page).to have_css 'article.product'
  # end

  scenario "user clicks on a product" do
    visit root_path
    click_on @category.products.first.name

    sleep(1)
    save_screenshot
    expect(page).to have_css '.dl-horizontal'
  end

end
