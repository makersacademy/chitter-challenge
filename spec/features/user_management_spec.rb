require 'spec_helper'

feature 'Feature - User Sign Up' do

  def sign_up email = 'sanjsanj@hotmail.com',
              password = 'password', password_confirmation = 'password',
              user_name = 'Sanjay Purswani', user_handle = 'sanjsanj'
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :user_name, with: user_name
    fill_in :user_handle, with: user_handle
    click_button 'Sign up'
  end

  scenario 'succeeds with required details' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, sanjsanj@hotmail.com'
    expect(User.first.email).to eq 'sanjsanj@hotmail.com'
    expect(User.first.user_name).to eq 'Sanjay Purswani'
    expect(User.first.user_handle).to eq 'sanjsanj'
  end

  scenario 'fails without password confirmation' do
    expect { sign_up 'a@a.com', 'pass', 'wrong' }.to change(User, :count).by 0
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

end

feature 'Feature - User Signs In' do

  before(:each) do
    User.create email: 'sanjsanj@hotmail.com',
                password: 'password', password_confirmation: 'password',
                user_name: 'Sanjay Purswani', user_handle: 'sanjsanj'
  end

  def sign_in email, password
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  scenario 'succeeds with correct credentials' do
    visit '/'
    expect(page).not_to have_content 'Welcome, sanjsanj@hotmail.com'
    sign_in 'sanjsanj@hotmail.com', 'password'
    expect(page).to have_content 'Welcome, sanjsanj@hotmail.com'
  end

  scenario 'fails without correct credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, sanjsanj@hotmail.com')
    sign_in('sanjsanj@hotmail.com', 'wrong')
    expect(page).not_to have_content('Welcome, sanjsanj@hotmail.com')
  end


end
