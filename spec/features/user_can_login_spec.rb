feature 'User can enter their login details' do

  scenario 'User logs in, their name is now displayed' do
    visit('/peeps/sign_up')
    fill_in 'email_sign_up', with: 'fake_email@gmail.com'
    fill_in 'password_sign_up', with: '1234'
    click_button('Login')
  end

end