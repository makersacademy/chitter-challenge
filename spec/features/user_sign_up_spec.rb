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

  scenario 'User must enter username to sign up' do
      expect{sign_up(username: nil)}.not_to change(User, :count)
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
    expect(page).to have_content 'Email address invalid'
  end

  scenario 'user can not sign up with an already registered username' do
    sign_up(username: 'andy')
    expect { sign_up(email:'cool@gmail.com', username: 'andy') }.not_to change(User, :count)
    expect(page).to have_content 'Username invalid'
  end


  scenario 'anyone can see messages, even if not signed in' do
    visit '/'
    click_button 'Display Messages'
    expect(page).to have_content 'Messages'
  end

end
