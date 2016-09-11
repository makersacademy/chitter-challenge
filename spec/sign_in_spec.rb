require 'spec_helper'

feature 'An existing user can sign in' do
  let!(:user) do

  User.create(name: 'James', email: 'james@hello.com',
              username: 'jamesman', password: '1234',
              password_confirmation: '1234')
  end
  scenario 'An existing user signs in with their username and password' do
    sign_in
    expect(current_path).to eq '/peeps'
    expect(page).to have_content("Welcome, #{user.name}!")
  end
end
