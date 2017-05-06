
feature 'Log in' do
	scenario 'User enters correct username and password and goes to account page' do
		add_user
		visit '/login'
		expect(page.status_code).to eq 200
		fill_in 'username', with: 'sam'
		fill_in 'password', with: '1234'
		click_button 'Submit'
		expect(page).to have_content 'Name: Sam Blausten'
		expect(page).to have_content 'Email: test@test.com'
		expect(page).to have_content 'Username: sam'
		expect(current_path).to eq '/account'
	end
	scenario 'User enters incorrect password and recieves flash message' do
		add_user
		visit '/login'
		expect(page.status_code).to eq 200
		fill_in 'username', with: 'sam'
		fill_in 'password', with: '1111'
		click_button 'Submit'
		expect(page).to have_content 'Invalid username or password'
		expect(current_path).to eq '/login'
	end
end