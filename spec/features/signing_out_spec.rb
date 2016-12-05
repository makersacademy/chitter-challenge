feature 'Signing out' do

  scenario 'User can sign out from being signed in' do
    sign_up
    sign_in(username: 'jsmith2016', password: 'pizza123!')
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye'
    expect(page).not_to have_content "Welcome jsmith2016"
  end

end
