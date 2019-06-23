feature 'Welcome page' do
  scenario 'Displays welcome message' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end
