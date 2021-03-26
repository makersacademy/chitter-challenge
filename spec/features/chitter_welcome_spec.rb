feature 'Viewing index' do
  scenario 'See a welcome message' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter!')
  end
end
