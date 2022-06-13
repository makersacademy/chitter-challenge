feature 'A user posts text to the page' do
  scenario 'The text is printed to the page' do
  visit('chitter')
  fill_in('Whats on your mind?', with: "This is a great weekend")
  click_button('Submit')
  expect(page).to have_content("This is a great weekend")
  end
end