feature 'Visit homepage' do
  scenario 'User can visit homepage and see a welcome message' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end
