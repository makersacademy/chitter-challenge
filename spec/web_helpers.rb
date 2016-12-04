def sign_up(firstname: 'John',
			surname: 'Doe',
			email: 'john@doe.com',
			username: 'JayDawg',
			password: 'password123',
			password_confirmation: 'password123')
	visit '/users/new'
	expect(page.status_code).to eq(200)
	fill_in :firstname,  :with => firstname
	fill_in :surname, :with => surname
	fill_in :email, :with => email
	fill_in :username, :with => username
	fill_in :password, :with => password
	fill_in :password_confirmation, :with => password_confirmation
	click_button 'Sign Up!'
end

def sign_in(email:, password:)
	visit '/sessions/new'
	expect(page.status_code).to eq(200)
	fill_in :email, with: email
	fill_in :password, with: password
	click_button 'Sign In!'
end