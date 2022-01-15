feature 'Visiting Index page' do 
  scenario 'Shows a welcome message' do 
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
