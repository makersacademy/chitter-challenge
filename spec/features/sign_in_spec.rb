feature 'Sign up' do
	scenario 'user can sign up with name, username, email and password' do
		visit '/'
		fill_in('name', with: 'Steve')
		fill_in('username', with: 'SuperSteve4Prez')
		fill_in('email', with: 'steveisawesome@gmail.com')
		fill_in('password', with: 'steve123')
		click_button('Sign up')
	end
end
