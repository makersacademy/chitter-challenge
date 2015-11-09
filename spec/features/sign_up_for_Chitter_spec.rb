feature 'Add user to Chitter' do
  scenario 'I can sign up as a new user' do
  sign_up
  expect(page).to have_content('Welcome, Ezzy Elliott')
  end
end
# feature 'Improve sign up workflow' do
# end
# feature 'Implement sign up validation' do
# end
# feature 'Prevent duplicates' do
# end
