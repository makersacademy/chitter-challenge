feature 'Testing infrastructure' do
  scenario 'making sure testing infrastructure working' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
end
