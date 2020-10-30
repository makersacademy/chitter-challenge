feature 'sign out' do
  scenario 'user signs out and gets confirmation message' do
    sign_in
    click_button('Sign out')
    expect(page).to have_content 'You have been signed out'
  end
end
