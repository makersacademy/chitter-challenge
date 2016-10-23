def create_user(name: "default",
                username: "defaultio",
                email: "default@example.com",
								password: "password",
								password_confirmation: "password")

  visit('/create_user')
  fill_in :name, with: name
  fill_in :username, with: username
	fill_in :email, with: email
	fill_in :password, with: password
	fill_in :password_confirmation, with: password_confirmation
	click_button('Create User')
end

def log_in_user(email: "default@example.com",
								password: "password")
	visit('/log_in')
	fill_in :email, with: email
	fill_in :password, with: password
	click_button('Log In')
end
