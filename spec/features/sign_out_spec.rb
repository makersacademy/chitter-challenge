feature 'Sign out' do
  scenario 'the sign in information is removed from the browser session' do
    sign_up
    sign_in
    click_button('Sign out')
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, kj')
  end
end
