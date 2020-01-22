feature 'index page working' do
  scenario 'is the index page working' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end
