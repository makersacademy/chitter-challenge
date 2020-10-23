feature 'Chitter' do
  scenario 'visiting the index page' do
    visit('/tweets')
    expect(page).to have_content "Welcome to Chitter. Like twitter, only shitter"
  end
end