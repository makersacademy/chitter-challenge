require './app/data_mapper_setup'

describe User do 
	let!(:user) { User.create(email: 'ben@test.com', username: '@ben', password: 'password', password_confirmation: 'password') }

	it "authenticates the user session when username and password are correct" do
		authenticated_user = User.authenticate(user.email, user.password)
		expect(authenticated_user).to eq user
	end

	it "does not authenticate the user session when username & password are incorrect" do
    authenticated_user = User.authenticate(user.email, 'wrong_password')
    expect(authenticated_user).to eq nil
	end

end