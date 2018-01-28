require 'web_helper'

feature 'User sign up' do
  scenario 'user can sign up as a new user' do
    expect { sign_up(user_name: 'Homer', email: 'homerj@gmail.com', password: 'donuts', password_confirmation: 'donuts') }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, Homer')
    expect(User.last.email).to eq('homerj@gmail.com')
  end

scenario 'requires a matching confirmation password' do
  sign_up(user_name: 'Homer', email: 'homerj@gmail.com', password: 'donuts', password_confirmation: 'wrong')
  expect(page).to have_current_path("/sign_up")
  expect(page).to have_content("Password does not match the confirmation")
end

scenario 'requires a matching confirmation password' do
    expect { sign_up(user_name: 'Homer', email: 'homerj@gmail.com', password: 'donuts', password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
