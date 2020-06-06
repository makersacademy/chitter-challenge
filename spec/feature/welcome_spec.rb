feature 'welcome page' do
  
  scenario 'it should welcome a user to the site' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario 'it should have a link to add peep' do
    visit('/')
    expect(page).to have_button "Post a Peep"
  end

  scenario 'it should have a link to view peeps' do
    visit('/')
    expect(page).to have_button "View Peeps"
  end
end