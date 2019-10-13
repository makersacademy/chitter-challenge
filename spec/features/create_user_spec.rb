feature 'Sign up as a user' do
  scenario 'A new user is able to register' do
    visit('/')
    click_button('Sign up!')
    fill_in('name', with: 'Homer Simpson')
    fill_in('username', with: 'Chunkylover53')
    fill_in('email', with: 'Chunkylover53@aol.com')
    fill_in('password', with: 'Marge')
    click_button('Register')

    expect(page).to have_content 'Welcome, Chunkylover53. You are now logged in'
  end
end