require 'spec_helper'

feature 'user sign in' do
  let!(:user) do
    User.create(email: 'database_guru@gmail.com',
                name: 'Lord Vader',
                user_name: 'darth',
                password: 'awesome123',
                password_confirmation: 'awesome123')
  end

  scenario 'a user can sign in with correct credentials' do
    sign_in
    expect(page).to have_content "Welcome, darth"
    expect(current_path).to eq '/cheeps/new'
  end

  scenario 'a user cannot sign in with incorrect credentials' do
    sign_in_incorrect
    expect(page).to have_content 'Your password and user name did not match'
    expect(current_path).to eq '/sessions'
  end
end
