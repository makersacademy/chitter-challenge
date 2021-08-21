feature 'user signout' do
  scenario 'user can signout' do
    user_sign_in
    click_on('Sign Out')
    expect(page).to have_content('Sign In')
  end
  
  # can only sign out if signed in
end