feature 'View login page' do
  scenario 'Visit the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter App, click Log-in to start peeping"
  end
end
