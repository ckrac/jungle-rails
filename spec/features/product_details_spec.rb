require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario 'User can navigate to product detail page from the home page' do
    # ACT
    visit root_path
    within first(".product") do
      click_on 'Details'
    end
    # VERIFY
    expect(page).to have_content('Reviews')
    # DEBUG
    save_screenshot
  end

end
