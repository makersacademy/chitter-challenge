feature 'User Sign Up' do
  scenario 'There is a Sign Up Page' do
    visit '/users/new'
    expect(page.status_code).to be 200
    expect(page).to have_content "Sign Up"
  end

  scenario 'User can sign up' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome Example Name'
    expect(User.first.email).to eq 'example@gmail.com'
  end

  scenario 'User must enter email to sign up' do
      expect{sign_up(email: nil)}.not_to change(User, :count)
  end

  scenario 'User must enter valid email to sign up' do
    expect{sign_up(email: 'invalid@gmail')}.not_to change(User, :count)
  end

  scenario 'User must enter valid password confirmation to sign up' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match confirmation'
  end

  scenario 'user can not sign up with an already registered email address' do
    sign_up(email: 'andy101@gmail.com')
    expect { sign_up(email: 'andy101@gmail.com') }.not_to change(User, :count)
    expect(page).to have_content 'Email address taken'
  end

  scenario 'anyone can see messages, even if not signed in' do
    visit '/'
    click_button 'Display Messages'
    expect(page).to have_content 'Messages'
  end


  def sign_up(name:                   'Example Name',
              username:               'example',
              email:                  'example@gmail.com',
              password:               'password',
              password_confirmation:  'password')
      visit '/users/new'
      fill_in 'name', with: name
      fill_in 'username', with: username
      fill_in 'email', with: email
      fill_in 'password', with: password
      fill_in 'password_confirmation', with: password_confirmation
      click_button('Sign Up')
  end

end
