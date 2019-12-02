feature 'User can visit the home page and read peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
    within(:css, '#buttons') do
      click_link 'Enter'
    end
  end
end
