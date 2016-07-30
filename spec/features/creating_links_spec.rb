require './spec/spec_helper'

feature 'Creating links' do
  scenario 'I want to see a form with title and URL text fields' do
    visit '/links/new'
    expect(page.status_code).to eq 200
    find_field('Title').value
    find_field('URL').value
    expect(page).to have_button('Add site')
  end

  scenario 'I want to add a site to my bookmarks' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.google.com'
    fill_in 'title', with: 'Google'
    click_button 'Add site'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
