feature 'Viewing Chitter' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_button "Log in"
    expect(page).to have_button "Create a User"
  end
end
