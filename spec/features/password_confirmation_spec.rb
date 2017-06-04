feature 'password confirmation' do
	scenario 'does not continue if there are two mismatching passwords' do
		visit '/'
		click_button 'Sign me up!'
		fill_in('name', with: 'Debra')
		fill_in('username', with: 'DollyDebs')
		fill_in('email', with: 'debbie@do.com')
		fill_in('password', with: '123')
		fill_in('confirmation', with: '456')
		click_button 'Sign up'
		expect(page).to have_content 'Passwords do not match!'
	end
end
