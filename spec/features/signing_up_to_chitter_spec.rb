feature 'A user can sign up to Chitter' do

  scenario 'user navigates to the signup page, fills in relevant information and then has their name displayed' do
    visit('/peeps/sign_up')
    fill_in 'handle_sign_up', with: 'Maker'
    fill_in 'email_sign_up', with: 'fake_email@gmail.com'
    fill_in 'password_sign_up', with: '1234'
    click_button('Sign Up')
  end

end
