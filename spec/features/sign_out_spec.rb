feature 'User signs out' do

  scenario 'while being signed in' do
    sign_up
    sign_in(email: 'user@example.com', password: '12345')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome example93')
  end

end
