feature 'View a message' do
  scenario 'it should display a message on chitter' do
    visit('/')
    click_on('Login')
    fill_in('message', with: 'My first message')
    click_on('Post')
    expect(page).to have_content('My first message')
  end
end