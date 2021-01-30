feature 'Home Page' do

  scenario 'Has a welcome message' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter!')
  end
end
