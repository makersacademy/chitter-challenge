feature 'authentication' do
	scenario 'A user can sign in' do
		User.create(name: 'test03', u_name: 'u_test03', email: 'test03@test.com', password: 'test1234')

		visit('/sessions/new')
		fill_in(:email, with: 'test03@test.com')
    	fill_in(:password, with: 'test1234')
   		click_button('Log in')

    	expect(page).to have_content 'Welcome, test03!'
	end
	scenario 'A user enter wrong email' do
		User.create(name: 'test5', u_name: 'u_test5', email: 'test5@test.com', password: 'test1234')

		visit('/sessions/new')
		fill_in(:email, with: 'prueba@example.com')
    	fill_in(:password, with: 'test1a234')
   		click_button('Log in')
   		expect(page).to have_content 'Please Check your email or password'
	end

	scenario 'A user enter wrong password' do
		User.create(name: 'test8', u_name: 'u_test8', email: 'test8@test.com', password: 'test1234')
		visit('/sessions/new')
		fill_in(:email, with: 'test8@test.com')
    	fill_in(:password, with: 'test1a234')
   		click_button('Log in')
   		expect(page).to have_content 'Please Check your email or password'
	end

	scenario 'A user can log out' do
		User.create(name: 'test9', u_name: 'u_test9', email: 'test9@test.com', password: 'test1234')
		visit('/sessions/new')
		fill_in(:email, with: 'test9@test.com')
    	fill_in(:password, with: 'test1234')
   		click_button('Log in')
   		click_button('Log out!')
   		expect(page).not_to have_content 'Welcome, test9'
	end
end