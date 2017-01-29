require 'spec_helper'

feature '#Sign Up' do
  scenario 'user can sign up for Chitter' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in 'Name', with: 'Byron'
    fill_in 'Email', with: 'thebest@thebest.com'
    fill_in 'User Name', with: 'ByronBest'
    fill_in 'Password', with: 'worldsbestpassword'
    click_button 'Submit'
    expect(current_path).to eq '/timeline'
    expect(page).to have_content 'Welcome, ByronBest'
  end
end
