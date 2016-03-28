def half_sign_up
	visit '/'
	click_link 'Sign up'
	fill_in('name', with: 'Bob')
  fill_in('user_name', with: 'BBy')
end

def sign_up
	half_sign_up
	fill_in('email', with: 'bob@gmail.com' )
  fill_in('password', with: 'bobByg' )
 	fill_in('password_confirmation', with: 'bobByg' )
	click_button 'Sign up'
end

def sign_up_same_details
		sign_up
		sign_up
end

def sign_up_with_taken_username
		sign_up
		half_sign_up
		fill_in('email', with: 'bob@hotmail.com' )
  	fill_in('password', with: 'bob' )
  	fill_in('password_confirmation', with: 'bob' )
		click_button 'Sign up'
end

def create_post
	sign_up
	fill_in('post', with: 'This is my first post!' )
	click_button 'Post a peep'
end