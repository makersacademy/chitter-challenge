feature 'User Sign Up' do
  scenario 'There is a Sign Up Page' do
    visit '/users/new'
    expect(page.status_code).to be 200
    expect(page).to have_content "Sign Up"
  end

  scenario 'User can sign up' do
    expect(sign_up).to change(User, :count).by(1)
  end

  def sign_up(email:                  'example@gmail.com',
              name:                   'Example Name',
              username:               'example',
              password:               'password',
              password_confirmation:  'password')
      visit '/users/new'
      fill_in 'email', with: email
      fill_in 'name', with: name
      fill_in 'username', with: username
      fill_in 'password', with: password
      fill_in 'password_confirmation', with: password_confirmation
      click_button('Sign Up')
  end
end
