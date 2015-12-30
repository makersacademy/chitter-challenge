feature 'User Sign In' do
  scenario 'Welcomes registered user upon log in' do
    register_new_user
    click_button("Log Out")
    sign_in_user
    # expect(page).to have_content('Welcome back James Borrell')
    expect(page).to have_content('Signed in as: BTrain012')
  end
  scenario 'User is able to post new chits if signed in' do
    register_new_user
    click_button("Log Out")
    sign_in_user
    expect(page).to have_content('New Post')
  end
end
