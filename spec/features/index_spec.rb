feature 'Visit the Chitter homepage' do
  scenario 'I want to visit the chitter homepage' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end