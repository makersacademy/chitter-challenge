require 'spec_helper'

feature 'User sign up' do
  
  def sign_up(email: 'dave@example.com',
              password: 'oranges',
              name: 'Dave',
              username: 'OrangeDave')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :name, with: name
    fill_in :username, with: username   
    click_button 'Sign up'
  end  

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, OrangeDave")
    expect(User.first.email).to eq("#dave@example.com")
  end

end