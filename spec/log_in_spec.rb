require 'web_helper'
require './app/models/user'

feature 'user log in' do

  let!(:user) do
    User.create(password: 'netrunner1', name: 'Kate McCaffrey')
  end

  scenario 'using the correct log in details' do
    log_in(password: user.password)
    p user.password
    expect(page).to have_content "Welcome to chitter #{user.name}!"
  end

  def log_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log in'
  end

end
