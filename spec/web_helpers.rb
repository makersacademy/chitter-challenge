
def add_user
	User.create(
		name: "Sam Blausten", 
		email: "test@test.com", 
		username: "sam", 
		password: "1234")
end


def sign_in (username, password)
	visit '/session/new'
	fill_in 'username', with: username
	fill_in 'password', with: password
	click_button 'Submit'
end