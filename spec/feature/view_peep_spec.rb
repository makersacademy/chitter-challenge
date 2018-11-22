feature 'content displayed' do
  scenario 'it displays a message' do
  visit '/chitter'
  expect(page).to have_content 'Hello world'
  end
end
