feature 'Adding a new message' do
  scenario 'A user can add a new message' do
  visit ('/peeps/new')
  fill_in('peep', with: 'this is a test comment')
  click_button('Post')

  expect(page).to have_content('this is a test comment')
  end
end
