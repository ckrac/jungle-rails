require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    @user = User.create!(first_name: 'Clark',
      last_name: 'Racadio',
      email: 'clark@rac.com',
      password: 'password',
      password_confirmation: 'password')
  end

  scenario 'Users can login successfully and are
  taken to the home page once they are signed in' do
    # ACT
    visit login_path
    fill_in 'email', with: 'clark@rac.com'
    fill_in 'password', with: 'password'
    click_on 'Submit'
    # VERIFY
    expect(page).to have_content('Logout')
    # DEBUG
    save_screenshot
  end
end

