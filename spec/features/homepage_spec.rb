feature 'The app is running' do
  scenario 'User visit the website' do
    visit ('/')
    expect(page).to have_content "Welcome to CHITTER!"
  end
end
