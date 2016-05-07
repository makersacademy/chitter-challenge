def sign_up(email: 'user@example.com', username: 'username', name: 'User Name', password: 'password1', password_confirmation: 'password1')
	visit('/users/new')
	fill_in('email', with: email)
	fill_in('username', with: username)
	fill_in('name', with: name)
	fill_in('password', with: password)
	fill_in('password_confirmation', with: password_confirmation)
	click_button('Sign up')
end

def sign_in(email: 'user@example.com', password: 'password1')
	visit('/sessions/new')
	fill_in('email', with: email)
	fill_in('password', with: password)
	click_button('Sign in')
end