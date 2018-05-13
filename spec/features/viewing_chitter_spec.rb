feature 'it loads up initial page' do
  scenario 'it shows Chitter' do
    visit('/peeps')
    expect(page).to have_content('Welcome to Chitter')
  end
end
