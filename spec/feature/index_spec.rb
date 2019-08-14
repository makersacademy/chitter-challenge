feature 'Testing infrastructure' do
  scenario 'Greeting page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
