require './app.rb'
require './spec/web_helper'

feature 'Create Cheeps' do
  scenario 'User visits homepage and posts a single Cheep' do
    visit_homepage_create_cheep('My heart will go on')

    expect(page).to have_content('My heart will go on')
    expect(page).to have_content('@celinedione')
    expect(page).to have_selector(:link_or_button, 'Create Cheep')
  end

  scenario 'User visit homepage and posts two Cheeps with the same handle' do
    visit_homepage_create_cheep('My heart will go on')
    visit_homepage_create_cheep('Every night in my dreams')

    expect(page).to have_content('My heart will go on')
    expect(page).to have_content('Every night in my dreams')
    expect(page).to have_content('@celinedione')
    expect(page).to have_selector(:link_or_button, 'Create Cheep')
  end
end
