
feature 'Sign up' do
	scenario 'User enters name email username and password' do
		visit '/'
		click_link 'Sign up'
		expect(page.status_code).to eq 200
		fill_in 'name', with: 'Sam Blausten'
		fill_in 'email', with: 'test@test.com'
		fill_in 'username', with: 'sam'
		fill_in 'password', with: '1234'
		click_button 'Submit'
		expect(page).to have_content 'Name: Sam Blausten'
		expect(page).to have_content 'Email: test@test.com'
		expect(page).to have_content 'Username: sam'
		expect(current_path).to eq '/account'
	end
	scenario "Can't sign up if username already exist" do
		add_user
		visit '/users/new'
		fill_in 'name', with: 'Sam Blausten'
		fill_in 'email', with: 'test1@test.com'
		fill_in 'username', with: 'sam'
		fill_in 'password', with: '1234'
		click_button 'Submit'
		expect(page).to have_content 'Username already in use'
		expect(page).not_to have_content 'Name: Sam Blausten'
		expect(page).not_to have_content 'Email: test@test.com'
		expect(page).not_to have_content 'Username: sam'
		expect(current_path).not_to eq '/account'
	end
	scenario "Can't sign up if email already exist" do
		add_user
		visit '/users/new'
		fill_in 'name', with: 'Sam Blausten'
		fill_in 'email', with: 'test@test.com'
		fill_in 'username', with: 'samb'
		fill_in 'password', with: '1234'
		click_button 'Submit'
		expect(page).to have_content 'Email already in use'
		expect(page).not_to have_content 'Name: Sam Blausten'
		expect(page).not_to have_content 'Email: test@test.com'
		expect(page).not_to have_content 'Username: sam'
		expect(current_path).not_to eq '/account'
	end
end