feature 'Test route' do
  scenario 'shows hello world' do
    visit('/')
    expect(page).to have_content('Hello World')
  end
end
