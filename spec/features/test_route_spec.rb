feature 'Test route' do
  scenario 'shows hello world' do
    visit('/test')
    expect(page).to have_content("Hello world")
  end
end
