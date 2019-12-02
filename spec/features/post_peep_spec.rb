feature 'Post peep' do
  scenario 'A user can post a message to Chitter' do
  visit('/peeps/new')
  fill_in('message', with: 'This is a new peep')
  click_button('Submit')

expect(page).to have_content "This is a new peep"
end
end
