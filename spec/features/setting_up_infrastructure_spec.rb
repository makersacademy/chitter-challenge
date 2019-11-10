feature 'infrastructure' do
  scenario 'Home page says "Welcome to Chitter"' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end
end
