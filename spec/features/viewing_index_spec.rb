feature 'Viewing index page' do
  scenario 'visiting index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
    expect(page).to have_button "See Peeps"
    expect(page).to have_button "Login to Post New Peep"
    expect(page).to have_button "Create New Account"
  end
end
