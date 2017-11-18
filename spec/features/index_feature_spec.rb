feature 'index' do
  scenario 'navigating to the index page' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
end
