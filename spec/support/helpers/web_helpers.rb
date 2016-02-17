def sign_up
	visit('/signup')
		fill_in 'username', with: 'cooluser_123'
		fill_in 'email', with: 'cool@me.com'
		fill_in 'password', with: 'secretpassword'
		click_button 'Sign Up'
end