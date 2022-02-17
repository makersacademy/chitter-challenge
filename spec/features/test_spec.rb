feature 'Test Index Page' do
  scenario 'should have index page' do
    visit('/')
    expect(page).to have_selector('h1', text: 'Chitter')
  end
end
