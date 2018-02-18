feature 'duplicate registrations' do
  scenario 'user cannot sign up with an already existing username' do
    2.times { sign_up }
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'user cannot sign up with an already existing email' do
    sign_up
    click_button "Sign up"
    fill_in 'username', with: 'Nathaniel'
    fill_in 'email', with: 'example@test.com'
    fill_in 'password', with: '12345'
    click_button 'Sign up'
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content 'Email is already taken'
  end
end
