require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bob@bob.com')
    expect(User.first.email).to eq('bob@bob.com')
  end

  def sign_up(email: 'bob@bob.com',
            password: 'bob123',
            password_confirmation: 'bob123')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Create'
  end

  scenario 'requires a matching confirmation password' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: 'bob@bob.com'
    fill_in :password, with: 'bob123'
    fill_in :password_confirmation, with: 'bob'
    click_button 'Create'
    expect { sign_up(password_confirmation: 'bob') }.not_to change(User, :count)
  end


  scenario 'Create a new user' do
    sign_up
    expect(User.first.email).to eq('bob@bob.com')
  end

  scenario 'I cannot sign up without an email address' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

end
