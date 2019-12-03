feature 'page has title' do
  scenario 'Chitter is shown' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter!')
  end
end
