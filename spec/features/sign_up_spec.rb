feature 'Sign up' do
	
	scenario 'with email, password, name and a user name' do
		visit '/'
		click_button 'Sign up'
		fill_in('name', with: 'Bob')
  	fill_in('user_name', with: 'BBy')
  	fill_in('email', with: 'bob@gmail.com' )
  	fill_in('password', with: 'bobByg' )
  	fill_in('password_confirmation', with: 'bobByg' )
		click_button 'Sign up'
		expect(page).to have_content 'Welcome BBy!'
  end

end