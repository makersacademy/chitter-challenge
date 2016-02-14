require 'spec_helper'

feature 'user logs in' do

  let!(:user) do
    User.create(email: 'test@test.com',
                password: 'password123',
                password_confirmation: 'password123')
  end

  def login(email:, password:)
    visit '/login'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'log in'
  end

  scenario 'user logs in with correct credentials' do
    login(email: user.email, password: user.password)
    # expect(page).to have_content "Welcome, #{user.email}"
  end

end
