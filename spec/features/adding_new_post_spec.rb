require 'pg'

feature 'Adding a post' do
  scenario 'a user can add a post to appear on the chitter page' do
    visit('/chitter/new')
    fill_in('post', with: 'This is my FIRST chitter post')
    click_button('Submit')
    expect(page).to have_content 'This is my FIRST chitter post'
  end
end
