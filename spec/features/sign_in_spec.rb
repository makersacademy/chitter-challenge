feature 'Signing in' do
	scenario 'user is not logged in if password / username do not match' do
		visit '/'
		click_button 'Sign me in!'
		fill_in('email', with: 'steveisawesome@gmail.com')
		fill_in('password', with: 'wrongpassword')
		click_button 'Sign in'
		expect(page).to have_content('Username and password do not match!')
	end

	scenario 'user is not logged in if username does not exist' do
		visit '/'
		click_button 'Sign me in!'
		fill_in('email', with: 'cthulhu@wrath.com')
		fill_in('password', with: 'humanisevil')
		click_button 'Sign in'
		expect(page).to have_content('Username does not exist!')
	end
end
