require 'spec_helper.rb'

feature 'user is able to sign out' do

  before(:each) do
    User.create(name: 'Amanda',
                username: 'amanda',
                email: 'hello@example.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'whilst the user is signed in' do
    sign_in(email: 'hello@example.com', password: 'password')
    click_button 'sign out'
    expect(page).to have_content('goodbye :)')
    expect(page).not_to have_content('welcome, hello@example.com')
  end
end
