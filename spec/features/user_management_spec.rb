feature 'User management' do

  scenario 'User can sign up with username, email, password' do
    visit('/')
    fill_in('user_name', with: 'jinis')
    fill_in('email', with: 'jinis@aol.jp')
    fill_in('password', with: 'jinis1219')
    click_button('Sign up')
    expect(page).to have_content('Welcome to Chitter, jinis!')
  end
end
