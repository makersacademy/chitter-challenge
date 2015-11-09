module SessionHelpers

	def sign_up(name: 'Dan Wheeler', username: 'd9nny',
							email: 'dan@google.com', password: 'test123', 
							password_confirmation: 'test123')
		visit('/users/register')
		expect(page.status_code).to eq(200)
		fill_in(:name, with: name)
		fill_in(:username, with: username)
		fill_in(:email, with: email)
		fill_in(:password, with: password)
		fill_in(:password_confirmation, with: password_confirmation)
		click_button('Sign Up')
	end

	def sign_in(username: 'd9nny', password: 'test123')
		sign_up
		click_button('Sign out')
		visit('/homepage')
		expect(page.status_code).to eq(200)
		fill_in(:username1, with: username)
		fill_in(:password1, with: password)
		click_button('Sign in')
	end

	def write_message
		visit '/homepage'
		sign_up
		fill_in(:peep, with: 'Happy Friday')
		click_button('Post')
	end
end