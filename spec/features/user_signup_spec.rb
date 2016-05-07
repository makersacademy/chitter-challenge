feature 'User Signup' do

	scenario '- user can sign up successfully, enter database and go to signin page' do
    expect{ sign_up }.to change{ User.count }.by 1
    expect(current_path).to eq '/sessions/new'
	end

	scenario '- signup fails if password confirmation is not the same as password' do
		expect{ sign_up(password_confirmation: 'password2') }.not_to change{ User.count }
		expect(page).to have_content 'Password does not match the confirmation'
	end

	scenario '- signup fails if email is already taken, though username is unique' do
		sign_up
		expect{ sign_up(username: 'username2') }.not_to change{ User.count }
		expect(page).to have_content 'Email is already taken'
	end

	scenario '- signup fails if username is already taken, though email is unique' do
		sign_up
		expect{ sign_up(email: 'user2@example.com') }.not_to change{ User.count }
		expect(page).to have_content 'Username is already taken'
	end

	scenario '- signup fails if email is not provided' do
		expect{ sign_up(email: nil) }.not_to change{ User.count }
		expect(page).to have_content 'Email must not be blank'
	end

	scenario '- signup fails if password is not provided' do
    expect{ sign_up(password: nil) }.not_to change{ User.count }
		expect(page).to have_content 'Password must not be blank'
	end

	scenario '- signup fails if username is not provided' do
		expect{ sign_up(username: nil) }.not_to change{ User.count }
		expect(page).to have_content 'Username must not be blank'
	end

	scenario '- provides full list of errors for invalid signup' do
		sign_up
		sign_up(username: nil)
		expect(page).to have_content 'Email is already taken'
		expect(page).to have_content 'Username must not be blank'
	end

end