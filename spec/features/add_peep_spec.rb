require_relative 'test_helper'

feature 'add peeps to chitter' do
  scenario 'user adds a peep' do
    create_account
    visit '/home'
    click_button 'New Peep'
    fill_in 'post', with: "Hello, chitter!"
    click_button 'Post'
    expect(page).to have_content "Hello, chitter!"
  end
  scenario 'peep is authored by a user' do
    create_account
    visit '/home'
    click_button 'New Peep'
    fill_in 'post', with: "Hello, chitter!"
    click_button 'Post'
    expect(page).to have_content "Hannah says:"
  end
end
