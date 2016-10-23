describe User do

	let!(:user) do
		User.create(email: "foobar@foobar.com", password: "foobar", password_confirmation: "foobar")
	end

	it 'authenticates when given a valid email address' do
		authenticated_user = User.authenticate(user.email, user.password)
		expect(authenticated_user).to eq user
	end

	it 'wrong password' do
	  wrong_password_user = User.authenticate(user.email, "wrongpassword")
    expect(wrong_password_user).to_not eq user
	end
end