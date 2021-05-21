feature 'welcome page' do
  scenario 'user can navigate to homepage' do
    visit('/')
    expect(page).to have_content('Welcome to chitter')
  end
end