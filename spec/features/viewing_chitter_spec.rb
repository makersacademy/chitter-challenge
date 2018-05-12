feature 'it loads up initial page' do
  scenario 'it shows Chitter' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
end
