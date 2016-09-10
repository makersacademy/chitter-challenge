module SessionHelpers

  def sign_up(email: 'rosie@allott.com', password: 'my_password', password_confirmation: 'my_password')
    visit '/'
    expect(page).to have_content 'Chitter!'
    click_button 'Sign up'
    expect(current_path).to eq '/users/sign-up'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end
end
