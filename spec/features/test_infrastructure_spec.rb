feature 'Test route' do
  scenario 'shows hello world' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter!')
  end
end
