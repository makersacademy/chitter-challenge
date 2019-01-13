RSpec.feature 'Peep' do
  scenario "content of the peep is displayed on the page" do
  visit('/')
  fill_in :content, with: "Hello world!"
  click_button 'Submit'
  expect(page).to have_content("Hello world!")
  end
end
