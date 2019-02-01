feature 'Index page' do
  scenario 'Index page loads correctly' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
