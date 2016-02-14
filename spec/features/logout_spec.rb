require 'spec_helper'

feature 'a user logs out' do

  scenario 'user logs out' do
    visit '/login'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'lala!'
    click_button 'log in'
    visit '/home'
    click_button 'log out'
    expect(current_path) == ('/login')
  end

end
