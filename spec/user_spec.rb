describe User do

	let(:user){ described_class.create(email: 'user@example.com', username: 'username', name: 'User Name', password: 'password1', password_confirmation: 'password1') }

	context '#authenticate' do
		it 'returns the user if their password is authenticated' do
			authenticated = User.authenticate({password: 'password1', email: user.email})
			expect(authenticated).to eq user
		end
		it 'returns false if the password is not authenticated' do
			not_authenticated = User.authenticate({password: 'wrong password', email: user.email})
			expect(not_authenticated).to eq false
		end
	end

end