def sign_up
	visit('/')
	click_link('Sign Up')
	fill_in :name, with: 'Riya'
	fill_in :email, with: 'riya.pabari@gmail.com'
	fill_in :password, with: 'password'
	click_button('Sign Up')
end