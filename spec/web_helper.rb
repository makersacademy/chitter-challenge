def sign_up
	fill_in 'last name', with: 'test_lastname'
	fill_in 'first name', with: 'test_firstname'
    fill_in 'date of birth', with: '21/03/2006'
    fill_in 'email', with: 'test.email@test.com'
    fill_in 'username', with: 'test_username'
    fill_in 'password', with: 'test_password'
end

def sign_in
	fill_in 'username', with: 'test_username'
	fill_in 'password', with: 'test_password'
end