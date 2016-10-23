require 'spec_helper'

feature 'I want to log in to Chitter' do

  let!(:user) do
    User.create(username: "tansaku",
              name: "Samuel Russell Hampden Joseph",
              email: "sam@makersacademy.com",
              password: "s3cr3t",
              password_confirmation: "s3cr3t")
  end

  scenario 'User can log in' do
    sign_in(username: user.username, password: user.password)
    expect(current_path).to eq '/home'
    expect(page).to have_content("Hello #{user.username}!")
  end

  scenario 'User cannot log in if username field is empyy' do
    sign_in(username: nil, password: user.password)
    expect(current_path).to eq '/sessions'
    expect(page).to have_content("The username or password is incorrect")
  end

  scenario 'User cannot log in if incorrect password is entered' do
    sign_in(username: user.username, password: "secret")
    expect(current_path).to eq '/sessions'
    expect(page).to have_content("The username or password is incorrect")
  end

  def sign_in(username:, password:)
    visit 'sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Submit'
  end

end
