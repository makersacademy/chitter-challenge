feature 'Viewing Chitter' do
  scenario 'Visiting the Index page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
