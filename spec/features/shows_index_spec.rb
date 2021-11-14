feature 'shows index' do
  scenario 'visits index page' do
    visit('/')
    expect(page).to have_content "Chitter!"
  end
end
