feature 'viewing chitter' do
  scenario 'viewing the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end
