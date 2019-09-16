feature 'locate home page' do
  scenario 'find home page with form' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
