require 'spec_helper'

feature 'sign in' do

  scenario 'An existing user can sign in' do
    sign_up(email: 'james@gmail.com',
            name: 'Test User',
            username: 'james93',
            password: 'password1',
            password_confirmation: 'password1')

    expect(User.count).to eq(1)

    sign_in(email: 'james@gmail.com',
            password: 'password1')

    expect(page).to have_content("Welcome Test User")
  end

  scenario 'An non-existing user can not sign in' do
    sign_in(email: 'non_user@test.com',
            password: 'password1')

    expect(current_path).to eq '/sign_in'
  end



end
