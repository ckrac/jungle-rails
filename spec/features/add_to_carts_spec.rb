require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "User can click on 'Add to Cart' button for a product on the home page
  and in doing so their cart inscreases by one" do
    # ACT
    visit root_path
    within first(".product") do
      click_on 'Add'
    end
    # VERIFY
    expect(page).to have_content('My Cart (1)')
    # DEBUG
    save_screenshot
  end
end
