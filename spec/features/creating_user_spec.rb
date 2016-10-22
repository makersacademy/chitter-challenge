feature 'Creating a user' do
	scenario 'and providing correct details' do
		#creates a user with correct details
		create_user(:user,:'username@example.com',:username,:password,:password)
		expect(page).to have_content "You are signed in as user"
	end

	scenario 'and providing mismatching passwords' do
		expect{ create_user(:user,:'username@example.com',:username, :password,:incorrect_password) }.to_not change(User, :count)
		expect(page).to have_content "Password does not match the confirmation"
	end

	scenario 'using an existing email address' do
		create_user(:user,:'username@example.com',:username, :password,:password)
		expect{ create_user(:user2,:'username@example.com',:username, :password,:password) }.to_not change(User, :count)
		expect(page).to have_content "Email is already taken"
	end

	scenario 'using an existing username' do
		create_user(:user,:'username@example.com',:username, :password,:password)
		expect{ create_user(:user,:'usernam@example.com',:username, :password,:password) }.to_not change(User, :count)
		expect(page).to have_content "Username is already taken"
	end
end 	