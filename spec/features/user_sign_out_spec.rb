require 'spec_helper'

feature 'User can sign out' do

  let!(:user) do
    User.create(email: 'dave@example.com',
                name: 'dave',
                user_name: 'B1GDAVE',
                password: '123',
                password_confirmation: '123')
  end

  scenario 'when signed in' do
      sign_in(email: user.email, password: user.password)
      click_button 'Sign out'
      expect(page).to have_content 'See ya!'
      expect(page).not_to have_content "Welcome, #{user.name.capitalize}"
    end
end
