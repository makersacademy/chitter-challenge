feature 'signing up' do
  scenario 'after signing up, a maker can post messages' do
  valid_sign_up
  expect(page).to have_content 'Welcome, David Wright'
  end
end
