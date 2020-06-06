feature 'welcome page' do
  
  scenario 'it should welome a user to the site' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end