feature 'Post a message' do
  scenario 'it should add a message to chitter' do
    visit('/')
    click_on('login')
    expect(page).to have_content('My first message')
  end
end
