feature 'User Signin' do

	scenario '- user can sign in successfully and receive welcome' do
		sign_up
		sign_in
		expect(page).to have_content('Hello username')
	end

	scenario '- signin fails with incorrect details and user receives error message, not welcome' do
		sign_up
		sign_in(password: 'password2')
		expect(page).to have_content('Email address or password is incorrect')
		expect(page).not_to have_content('Hello username')
	end

	scenario '- signin fails if a user is already signed in' do
		sign_up
		sign_in
		sign_up(email: 'user2@example.com', username: 'username2')
		sign_in(email: 'user2@example.com', password: 'password1')
		expect(page).to have_content('Sorry, username is already signed in')
		expect(page).not_to have_content('Hello username2')
	end

end