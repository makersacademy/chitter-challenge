require 'spec_helper'
feature 'let a user sign up' do
  scenario 'a user signs in on the /sign_up page' do
    visit '/sign_up'
    fill_in('email', with: '1@1.com')
    fill_in('password', with: '123')
    fill_in('password_confirmation', with: '123')
    click_button('Sign Up')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome 1@1.com')
    expect(User.first.email).to eq('1@1.com')
    expect(User.count).to eq(1)
  end

end
