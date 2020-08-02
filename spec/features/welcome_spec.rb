
feature 'Welcome message' do
  scenario 'The user visits the homepage and a welcome message is displayed' do
    visit '/'
    expect(page).to have_content('Welcome to chitter')
  end
end
