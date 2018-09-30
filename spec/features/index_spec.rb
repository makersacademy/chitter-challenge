feature 'Viewing messages test' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter page"
  end
end
