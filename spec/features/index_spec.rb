feature 'Viewing Chitter' do
  scenario 'Visiting the Index page' do
    visit('/')
    # Testing index has welcome message
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
