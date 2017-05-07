def sign_up(
		email: 'email@email.co.uk',
		username: 'Anthony',
		password: 's3cr3t',
		password_confirmation: 's3cr3t'
	)
	 visit '/user/new'
	 fill_in 'email', with: email
	 fill_in 'username', with: username
	 fill_in 'password', with: password
	 fill_in 'password_confirmation', with: password_confirmation
	 click_button 'Sign up'
end

def sign_in(email: 'email@email.co.uk', password: 's3cr3t')
	 visit '/user/login'
	 fill_in 'email', with: email
	 fill_in 'password', with: password
	 click_button 'Login'
end
