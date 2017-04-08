require_relative 'web_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome clownfish@keepswimming.com')
    expect(User.first.email).to eq ('clownfish@keepswimming.com')
  end

  scenario 'requires a matching confirmation password' do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
  end

  def sign_up(email: 'clownfish@keepswimming.com',
    password: 'Dory',
    password_confirmation: 'Dory',
    name: 'Nemo Clownfish',
    username: '@NemoClown')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :name, with: name
    fill_in :username, with: username
    click_button('Sign up')
  end

end
