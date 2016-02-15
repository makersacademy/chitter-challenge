require 'spec_helper'

feature 'user sign in' do
  let(:user) do
    User.create(name:           'Michael Collins',
                email:        'michael@email.com',
                username:           'mjcollins86',
                password:              'p4ssw0rd',
                password_confirmation: 'p4ssw0rd')
  end

  scenario 'with correct login details' do
    sign_in(user.email, user.password)
    expect(page).to have_content("Hello, #{user.username}")
  end

  scenario 'without correct login details is not logged in' do
    sign_in(user.email, 'wrong')
    expect(page).not_to have_content("Welcome, #{user.email}")
    expect(page).to have_content('The email or password is incorrect')
  end
end
