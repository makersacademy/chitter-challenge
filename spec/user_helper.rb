def sign_up(
		email: 'email@mail.com', 
		username: 'Test_user', 
		password: 'super secret', 
		password_confirmation: 'super secret' 
	)
	visit '/user/new'
	fill_in 'email', with: email
	fill_in 'username', with: username
	fill_in 'password', with: password
	fill_in 'password_confirmation', with: password_confirmation
	click_button 'Sign up'
end

def sign_in(email: 'email@mail.com', password: 'super secret')
	visit '/user/login'
	fill_in 'email', with: email
	fill_in 'password', with: password
	click_button 'Login'
end