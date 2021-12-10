feature 'home page' do
  scenario 'shows hello' do
    visit('/')
    expect(page).to have_content('hello')
  end
end