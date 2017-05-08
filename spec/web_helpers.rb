
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

def sign_up(name, email, username, password)
	visit '/users/new'
	fill_in 'name', with: name
	fill_in 'email', with: email
	fill_in 'username', with: username
	fill_in 'password', with: password
	click_button 'Submit'
end

def post_message(message)
	visit '/'
	fill_in 'message', with: message
	click_button 'Peep!'
end