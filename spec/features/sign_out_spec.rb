require 'spec_helper'

RSpec.feature 'sign out', type: :feature do

  before(:each) do
    User.create(email: 'Dio@test.com', password: '123456',
                password_confirmation: '123456')
  end

  scenario "user can sign out while signed in" do
    sign_in(email: 'Dio@test.com', password: '123456')
    click_button 'Sign out'
    expect(page).to have_content "Goodbye!"
    expect(page).not_to have_content "Succesful login, Dio@test.com"
  end


end
