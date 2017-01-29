def sign_up
	visit '/newusers'
    fill_in 'name', with: "Sam Jones!"
    fill_in 'email', with: "sam@email.com"
    fill_in 'user_name', with: "username"
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Sign Up!'
end



def sign_in
	visit '/newsessions'
    fill_in :user_name, with: 'username'
    fill_in :password, with: 'password'
    click_button 'Sign in'
end
