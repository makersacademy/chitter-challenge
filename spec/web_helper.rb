def sign_up
	visit '/'
	within('form#SignUp') do
		fill_in :username, with: 'username'
		fill_in :email, with: 'name@gmail.com'
		fill_in :name, with: 'Name'
		fill_in :password, with: 'password'
		click_button 'Sign up'
	end
end
