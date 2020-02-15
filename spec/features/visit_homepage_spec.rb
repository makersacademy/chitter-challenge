feature 'Visit homepage' do
  scenario 'A user can visit the homepage' do
    visit('/')
    expect(page).to have_content("Welcome to Chitter!")
  end
end
