require 'capybara/rspec'

feature 'Viewing peeps' do
  scenario 'the user can see a list of peeps' do
  visit('/')
  expect(page).to have_content "how are you people?"
  expect(page).to have_content "bored at home"
  end
end
