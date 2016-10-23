require 'spec_helper'

RSpec.feature 'User can sign in' do

  let!(:user) do
    User.create(name: 'Sally Went',
                user_name: 'sallywent1990',
                email: 'where.did.sally.go@yahoo.com',
                password: 'ginger123',
                password_confirmation: 'ginger123')
  end

  scenario 'uses correct details' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome, #{user.user_name}")
  end
end
