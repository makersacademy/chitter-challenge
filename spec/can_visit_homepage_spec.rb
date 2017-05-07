feature 'Can visit Chitter homepage' do
  scenario 'The Chitter homepage loads' do
    visit('/')
    expect(page.status_code).to eq 200
    expect(page).to have_content "Welcome to Chitter"
    expect(page).to have_button("Sign Up")
    expect(page).to have_button("Login")
    expect(page).to have_content("Peeps")
  end
end
