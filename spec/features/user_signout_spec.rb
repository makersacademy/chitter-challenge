feature 'User sign out' do
  scenario 'Sign out button available when signed in' do
    expect(page).not_to have_button("Sign Out")
    sign_up_correctly
    sign_in_correctly
    expect(page).to have_button("Sign Out")
  end

  scenario 'Signing out logs the user out' do
    sign_up_correctly
    sign_in_correctly
    click_button("Sign Out")
    expect(page).to have_button("Sign In")
  end
end
