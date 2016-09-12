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


  scenario "user tries to sign up with mismatching passwords" do
    add_email_and_password
    fill_in('password_confirmation', with: '456')
    click_button('Sign Up')
    expect(page).to have_content('Password mismatch')
    expect(User.count).to eq 0
  end

  scenario 'user tries to sign up with no email address' do
    add_password_twice
    click_button('Sign Up')
    expect(User.count).to eq 0
    expect(page).to have_content('Email is mandatory')
  end

  scenario 'user tries to sign up with a non valid email address' do
    add_password_twice
    fill_in('email', with: '123')
    click_button('Sign Up')
    expect(User.count).to eq 0
    expect(page).to have_content("Doesn't look like an email address")
  end

  scenario 'user sign up with existing email' do
    2.times do
      add_email_and_password
      fill_in('password_confirmation', with: '123')
      click_button('Sign Up')
    end
    expect(User.count).to eq 1
    expect(page).to have_content("We already have that email")
  end

end
