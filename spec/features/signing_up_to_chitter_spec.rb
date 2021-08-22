feature 'A user can sign up to Chitter' do

  scenario 'user navigates to the signup page, fills in relevant information and then has their name displayed' do
    visit('/peeps/sign_up')
    fill_in 'handle', with: 'Maker'
    fill_in 'email', with: 'fake_email@gmail.com'
    fill_in 'password', with: '1234'
    click_button('Sign Up')
  end

end
