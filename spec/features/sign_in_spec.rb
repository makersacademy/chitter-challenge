feature 'Sign in' do

  scenario 'The user can sign in with the correct credentials' do
    user = create_test_user
    sign_in
    expect(page).to have_content("Hey #{user.username}")
  end

end
