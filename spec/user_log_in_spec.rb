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

  def sign_in(username:, password:)
    visit 'sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
