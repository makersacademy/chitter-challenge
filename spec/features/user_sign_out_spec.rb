
feature 'User signing out' do

  scenario 'a signed-in user signing out' do
    sign_up
    click_button('Sign Out')
    expect(page).to have_content("You've signed out successfully. See you soon!")
    expect(page).not_to have_content('Welcome, Sean')
  end

end
