feature 'view a welcome page' do
  scenario 'Basic greeting on home page' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end
end
