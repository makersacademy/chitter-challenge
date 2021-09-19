require 'pg'

feature 'Adding a post to the main chitter page' do
    scenario 'a user can add a post to the chitter page' do
      visit('/chitter/new')
      fill_in('post', with: 'This is an example chitter post')
      click_button('Post')

      expect(page).to have_content "This is an example chitter post"
    end
  end
