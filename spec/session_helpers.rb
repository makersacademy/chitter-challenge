module SessionHelpers

	def sign_in(username:, password:)
    visit '/'
		within('form#SignIn') do
    	fill_in :username, with: username
    	fill_in :password, with: password
    	click_button 'Sign in'
		end
  end

	def sign_up(username: 'bob123',
							email: 'bob@bob.com',
							name: 'Bob',
	            password: '12345678',
	            password_confirmation: '12345678')
		visit '/'
		within('form#SignUp') do
			fill_in :username, with: username
			fill_in :email, with: email
			fill_in :name, with: name
			fill_in :password, with: password
			fill_in :password_confirmation, with: password_confirmation
			click_button 'Sign up'
		end
	end


end
