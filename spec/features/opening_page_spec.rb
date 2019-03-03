feature 'Greeting when visiting the page' do
  scenario 'page has greeting message' do
    visit('/')
    expect(page).to have_content('Bienvenidos a Chitter')
  end
end
