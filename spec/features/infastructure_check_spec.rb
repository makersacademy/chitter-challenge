feature 'infastructure test' do
  scenario 'returns the text on home page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
