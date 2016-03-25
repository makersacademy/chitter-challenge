feature 'Sign up' do
	
	scenario 'with email, password, name and a user name' do
		sign_up
  	fill_in('email', with: 'bob@gmail.com' )
  	fill_in('password', with: 'bobByg' )
  	fill_in('password_confirmation', with: 'bobByg' )
		click_button 'Sign up'
		expect(page).to have_content 'Welcome BBy!'
  end

  scenario 'with an email is required' do
		sign_up
	 	fill_in('password', with: 'bobByg' )
	 	fill_in('password_confirmation', with: 'bobByg' )
		click_button 'Sign up'
		expect(page).to have_content 'Email must not be blank'
  end

  scenario 'with non-matching passwords is not allowed' do
		sign_up
  	fill_in('email', with: 'bob@gmail.com' )
  	fill_in('password', with: 'bobByg' )
  	fill_in('password_confirmation', with: 'bobB' )
		click_button 'Sign up'
		expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'with no password is not allowed' do
		sign_up
  	fill_in('email', with: 'bob@gmail.com' )
		click_button 'Sign up'
		expect(page).to have_content 'Password must not be blank'
  end

   scenario 'will not accept invalid email' do
		sign_up
    fill_in('email', with: 'bob@gmail' )
    fill_in('password', with: 'bobByg' )
    fill_in('password_confirmation', with: 'bobByg' )
    expect{click_button "Sign up"}.to change{User.count}.by 0
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'user cannot sign up twice with the same email' do
    expect{sign_up_same_details}.to change{User.count}.by 1
    expect(page).to have_content "Email is already taken"
  end

  scenario 'user cannot sign up with a username that already exists' do
    expect{sign_up_with_taken_username}.to change{User.count}.by 1
    expect(page).to have_content "User name is already taken"
  end

end