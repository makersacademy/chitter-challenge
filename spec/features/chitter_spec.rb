feature 'Viewing Chitter Page' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter Page"
  end
end
