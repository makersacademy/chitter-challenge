feature 'User signs out' do

  scenario 'after signing in' do
    correct_sign_in
    click_button 'Log-in'
    click_button 'sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, Ben')
  end

end
