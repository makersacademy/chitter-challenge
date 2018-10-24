feature 'sign up' do
  scenario 'user can sign up with their email address, name, username, and a password' do
    sign_up_user
    expect(page).to have_content "Welcome Chloe Verity, your username is chloeverity123"
  end
end
