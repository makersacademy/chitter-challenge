feature 'show welcome page' do
  scenario 'welcome to Chitter' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
end