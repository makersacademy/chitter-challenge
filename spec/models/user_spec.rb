
describe User do
	
let(:user) {User.create(name: 'Bob',
						email: 'bob@bob.com',
						password: 'password',
						password_confirmation: 'password')}

	it 'authenticates when given valid credentials' do
		authenticated_user = User.authenticate(user.email, user.password)
		expect(authenticated_user).to eq user
	end


end