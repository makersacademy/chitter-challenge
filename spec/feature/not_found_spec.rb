RSpec.feature 'Not Found' do
  scenario 'it shows up when page not found' do
    visit('/random/page')
    expect(page).to have_content('Sorry, that page doesn’t exist!')
  end
end
