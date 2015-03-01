require 'spec_helper'

feature 'User signs up' do

  scenario 'when being a new visitor visiting the site' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, example')
    expect(User.first.email).to eq('example@example.com')
  end
  
  def sign_up(name = 'example',
              email = 'example@example.com',
              username = 'example',
              password = 'example')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name,     :with => name
    fill_in :email,    :with => email
    fill_in :username, :with => username
    fill_in :password, :with => password
    click_button 'Sign up'  
  end

end