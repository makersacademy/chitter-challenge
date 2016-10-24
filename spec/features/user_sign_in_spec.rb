require 'spec_helper'

RSpec.feature 'User can sign in' do

  let!(:user) do
    User.create(name: 'Sally Went',
                user_name: 'sallywent1990',
                email: 'sillysally@yahoo.com',
                password: 'ginger123',
                password_confirmation: 'ginger123')
  end

  scenario 'uses correct details' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Howdy, #{user.user_name}")
  end

  scenario 'uses incorrect details' do
    sign_in(email: user.email, password: 'incorrect_password')
    expect(page).to have_content("Your email or password is incorrect")
  end

end
