feature 'Viewing chitter' do
  scenario 'visit the index page and see message welcome to chitter' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end