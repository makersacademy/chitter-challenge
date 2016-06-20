module SessionHelpers

def sign_up
	visit('/')
	click_link('Sign Up')
	fill_in :name, with: 'Bob'
	fill_in :email, with: 'bob@bob.com'
	fill_in :password, with: 'password'
	fill_in :password_confirmation, with: 'password'
	click_button('Sign Up')
end

def sign_up_wrong_pw
	visit('/')
	click_link('Sign Up')
	fill_in :name, with: 'Bob'
	fill_in :email, with: 'bob@bob.com'
	fill_in :password, with: 'password'
	fill_in :password_confirmation, with: 'wrong'
	click_button('Sign Up')
end

def sign_up_no_email
	visit('/')
	click_link('Sign Up')
	fill_in :name, with: 'Bob'
	fill_in :password, with: 'password'
	fill_in :password_confirmation, with: 'wrong'
	click_button('Sign Up')
end

def sign_up_no_name
	visit('/')
	click_link('Sign Up')
	fill_in :email, with: 'bob@bob.com'
	fill_in :password, with: 'password'
	fill_in :password_confirmation, with: 'wrong'
	click_button('Sign Up')
end

def sign_up_bad_email
	visit('/')
	click_link('Sign Up')
	fill_in :name, with: 'Bob'
	fill_in :email, with: 'bob'
	fill_in :password, with: 'bob'
	fill_in :password_confirmation, with: 'wrong'
	click_button('Sign Up')
end

def sign_in
	visit('/')
	click_link('Sign In')
	fill_in :email, with: 'bob@bob.com'
	fill_in :password, with: 'password'
	click_button('Sign In')
end

end