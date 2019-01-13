RSpec.feature 'Peep' do
  scenario "user create a peep and content of the peep is displayed on the page" do
  visit('/')
  fill_in :content, with: "Hello world!"
  click_button 'Post'
  expect(page).to have_content("Hello world!")
  end
end
