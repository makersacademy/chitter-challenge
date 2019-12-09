feature 'Sign in Page' do
  scenario 'requires a email and username to log into chitter' do
    visit('/')
    fill_in 'email', with: 'samm@makersacademy.com'
    fill_in 'password', with: 'password123'
    click_on('login')
    expect(page).to have_content('welcome samm@makersacademy.com')
  end
end
