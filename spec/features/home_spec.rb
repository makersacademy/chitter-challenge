feature 'Can connect to home page' do
  scenario 'Connection works' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter!')
  end
end