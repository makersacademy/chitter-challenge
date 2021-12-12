feature 'Sign up user' do
  scenario 'it should record user details' do
    visit('/')
    click_on('Sign up')
    fill_in('name', with: 'Pikachu')
    fill_in('username', with: 'Mighty Pikachu')
    fill_in('email', with: 'pikachu@gmail.com')
    fill_in('password', with: '13579pikapika')
    click_on('Submit')
    expect(page).to have_content('You have signed up successfully')
  end
end
