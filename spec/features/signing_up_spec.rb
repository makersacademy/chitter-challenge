require 'spec_helper'

feature 'Signing up' do
  scenario 'with their credentials' do
    sign_up
    expect(page).to have_content('Hello atulord!')
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq ('a@bc.edu')
  end

  scenario 'checks if the password is entered correctly'do
    expect{sign_up(password_confirmation: '123456')}.not_to change(User, :count)
  end
end
