def create_user
	let(:user) do 
		User.create(email: "foobar@example.com", password: "foobar",
			          password_confirmation: "foobar")
	end
end

def sign_in
  visit '/'
	fill_in :email, with: user.email
	fill_in :password, with: user.password
	click_button "Sign In"
end

def sign_up
	visit_register_page
	fill_in :email, with: 'foobar@foobar.com'
	enter_password_for_signup
  click_button 'Sign Up'
end

def visit_register_page
  visit '/'
	click_button 'Register'
end

def enter_password_for_signup
	fill_in :password, with: "foobar"
	fill_in :password_confirmation, with: "foobar"
end

