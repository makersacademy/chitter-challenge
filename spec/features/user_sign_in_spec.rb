require 'spec_helper'

feature 'user sign in' do
  let!(:user) do
    User.create(email: 'database_guru@gmail.com',
                name: 'Lord Vader',
                user_name: 'darth',
                password: 'awesome123',
                password_confirmation: 'awesome123')
  end

scenario 'a user can sign in' do
  visit '/sessions/new'
  expect(page.status_code).to eq 200
  fill_in :user_name, with: user.user_name
  fill_in :password, with: user.password
  click_button 'sign in'
  #expect(page).to have_content "Welcome, darth"
  expect(current_path).to eq '/cheeps'
end

end
