require 'web_helper'

feature 'Sign Up to Chitter' do

  scenario 'new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'welcome Cat_Peeps93'
  end

  scenario 'username/email must be unique' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Username is already taken'
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'password confirmation must match password' do
    visit '/users/new'
    fill_in 'name', with: 'Dave Mittens'
    fill_in 'username', with: 'Cat_Peeps93'
    fill_in 'email', with: 'dave@gmail.com'
    fill_in 'password', with: '12345'
    fill_in 'password_confirmation', with: '123'
    expect { click_button 'Sign Up!' }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

end
