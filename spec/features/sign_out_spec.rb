require 'spec_helper'

RSpec.feature 'signing out', :type => :feature do

  include Helpers

  let!(:user) do
    User.create(firstname: 'John',
      surname: 'Doe',
      email: 'john@doe.com',
      username: 'JayDawg',
      password: 'password123',
      password_confirmation: 'password123')
  end

  scenario 'user can sign out' do
    sign_in(email: user.email, password: user.password)
    click_button 'Log Out'
    expect(page).not_to have_content('Welcome, John!')
  end

end