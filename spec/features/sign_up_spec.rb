feature 'Sign Up' do

  scenario 'A new user can sign up for an account' do
    visit '/'
    within('div.sign-up') do
      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'pass123'
      fill_in 'name', with: 'Melvin Lau'
      fill_in 'username', with: 'melvinlau'
      click_button 'Sign Up'
    end
    expect(page).to have_content 'Melvin Lau'
  end

  # Edge case: user cannot sign up with an email that already exists in database.

end
