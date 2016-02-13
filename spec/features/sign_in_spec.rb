feature 'SIGN IN' do
  scenario '-> lets users sign in to an existing account' do
    sign_up
    visit('/')
    fill_in :username, with: 'marcus'
    fill_in :password, with: 'kebab1'
    expect(page).to have_current_path('/profile')
    expect(page).to have_content('Welcome marcus')
  end
end
