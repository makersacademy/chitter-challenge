feature 'Site mechanics' do
scenario 'A user can view the main site' do
  visit('/')
  expect(page).to have_no_content("Sinatra doesn't know this ditty")
end

scenario 'A user can view the register page' do
  visit('/register')
  expect(page).to have_content("Register for Chitter")
end
end
