
feature 'Sign in' do
	scenario 'User enters correct username and password and goes to account page' do
		add_user
		sign_in("sam", "1234")
		expect(page).to have_content 'Name: Sam Blausten'
		expect(page).to have_content 'Email: test@test.com'
		expect(page).to have_content 'Username: sam'
		expect(current_path).to eq '/account'
	end
	scenario 'User enters incorrect password and recieves flash message' do
		add_user
		sign_in("sam", "1212")
		expect(page).to have_content 'Invalid username or password'
		expect(current_path).to eq '/session/new'
	end
end