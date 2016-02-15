require 'spec_helper'

feature 'user sign out' do
  let(:user) do
    User.create(name:           'Michael Collins',
                email:        'michael@email.com',
                username:           'mjcollins86',
                password:              'p4ssw0rd',
                password_confirmation: 'p4ssw0rd')
  end

  scenario 'logged in user can sign out' do
    sign_in(user.email, user.password)

    visit '/'
    click_button 'Sign out'
    expect(page).not_to have_content('Hello, mjcollins86')
    expect(page).to have_content('Goodbye!')
  end
end
