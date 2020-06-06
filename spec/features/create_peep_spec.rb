# require 'spec_helper'

feature 'Welcome page' do
  scenario 'Two option buttons' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
end

feature 'Adding a new peep' do
  scenario 'A user can add a new peep to Peep db' do
    visit('/create_peep')
    fill_in('peep', with: 'Test peep')
    click_button('Peep peep')
    # expect(page).to have_content('Test peep')
  end

  # scenario 'The bookmark must be a valid URL' do
  #   visit('/bookmarks/new')
  #   fill_in('title', with: 'not a real bookmark')
  #   fill_in('url', with: 'not a real bookmark')
  #   click_button('Submit')

  #   expect(page).not_to have_content "not a real bookmark"
  #   expect(page).to have_content "Please submit a valid URL"
  # end
end