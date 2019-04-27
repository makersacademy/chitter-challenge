RSpec.feature 'when user visits index page' do
  scenario 'user sees hello world' do
    visit('/')
    expect(page).to have_content('Hello world')
  end
end