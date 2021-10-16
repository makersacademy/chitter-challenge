
feature 'Viewing login page' do
  scenario 'visiting the login page' do
    visit('/')
    expect(page).to have_content "Chitter"
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end
end
