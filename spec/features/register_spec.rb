require 'spec_helper'

feature 'registering' do
  scenario 'user registering' do
    visit '/'
    fill_in :name, with: 'tom'
    fill_in :username, with: 'tom'
    fill_in :email, with: 'tom@tom.com'
    click_button 'Register'
    expect(page).to have_content 'tom\'s nest'
  end
end