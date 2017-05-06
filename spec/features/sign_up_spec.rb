
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
end