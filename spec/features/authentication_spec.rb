feature 'authentication' do
  scenario 'a user can sign in' do
    siggning_in

    expect(page).to have_content 'Welcome, user321'
  end

  scenario 'a user sees an error if they get their username wrong' do
    siggning_in_with_wrong_username

    expect(page).not_to have_content 'Welcome, user321'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user sees an error if they enter wrong password' do
    siggning_in_with_wrong_password

    expect(page).not_to have_content 'Welcome, user321'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user can sign out' do
    siggning_in
    click_button 'Sign out'

    expect(page).not_to have_content 'Welcome, user321'
    expect(page).to have_content 'You have signed out.'
  end
end
