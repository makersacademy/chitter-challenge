feature 'registration' do
  scenario 'a user can sign up' do
  visit '/new'
  fill_in 'email', with: 'test@bla.com'
  fill_in 'password', with: 'its-a-secret'
  click_button 'Submit'

  expect(page).to have_content "Welcome, test@bla.com"
  end
end
