feature 'infrastructure' do
  scenario 'Home page says "The home of cat pictures"' do
    visit('/')
    expect(page).to have_content('The home of cat pictures')
  end
end
