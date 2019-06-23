feature 'Welcome page' do
  scenario 'Displays welcome messgae' do
    visit('/')
    expect(page).to have_content"Welcome to Chitter"
  end
end
