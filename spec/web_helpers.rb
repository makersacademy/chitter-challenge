def sign_up
	visit '/'
	click_button 'Sign me up!'
	fill_in('name', with: 'Steve')
	fill_in('username', with: 'SuperSteve4Prez')        
	fill_in('email', with: 'steveisawesome@gmail.com')
	fill_in('password', with: 'steve123')  
	fill_in('confirmation', with: 'steve123')
	click_button 'Sign up'
end

def sign_in
	visit '/'
	click_button 'Sign me in!'
	fill_in('email', with: 'steveisawesome@gmail.com')
	fill_in('password', with: 'steve123')
	click_button 'Sign in'
end
