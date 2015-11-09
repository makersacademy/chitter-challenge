require 'spec_helper'

feature 'Signing up' do
  scenario 'with their credentials' do
    sign_up
    expect(page).to have_content('Hello atulord!')
    expect(User.count).to eq(1)
    expect(User.first.email).to eq ('a@bc.edu')
  end

  scenario 'checks if the password is entered correctly'do
    expect{sign_up(password_confirmation: '123456')}.not_to change(User, :count)
    expect(current_path).to eq('/user/sign_up')
    expect(page).to have_content('Passwords are not identical')
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect {sign_up(email: 'chuchu')}.not_to change(User, :count)
  end

  scenario "won't allow multiple entries of the same email address" do
    sign_up
    expect{sign_up}.not_to change(User, :count)
  end
end
