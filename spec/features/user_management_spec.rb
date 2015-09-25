require 'spec_helper'

feature 'User can register' do

  let!(:user) { build :user }

  scenario 'I can register as a new user' do
    sign_up(user)
    expect(page.status_code).to eq 200
    expect(page).to have_content "Welcome, #{user.name}"
  end

  def sign_up(user)
    visit '/'
    fill_in 'email',                 with: user.email
    fill_in 'password',              with: user.password
    fill_in 'password_confirmation', with: user.password_confirmation
    fill_in 'name',                  with: user.name
    fill_in 'username',              with: user.username
    click_button 'Sign up'
  end
end
