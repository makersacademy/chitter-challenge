feature 'Home Page' do
  scenario 'User visits home page' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
