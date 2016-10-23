require 'spec_helper'

feature 'User can sign in' do

  let!(:user) do
    User.create(email: 'dave@example.com',
                name: 'dave',
                user_name: 'B1GDAVE',
                password: '123',
                password_confirmation: '123')
  end

  scenario 'with correct email and password' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome, #{user.name.capitalize}")
  end

  scenario 'with incorrect email and password' do
     sign_in(email: user.email, password: "wrong")
     expect(page).to have_content("Email or password is incorrect")
   end


end
