feature 'Peeps should be visible' do
  scenario 'Preset peeps should appear on page' do
    visit('/')
    expect(page).to have_content('Can somebody make me a cup of tea?')
  end
end
