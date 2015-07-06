feature 'Signing out' do

  scenario 'after logging in a user can sign out' do
    sign_in
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye!'
  end

end
