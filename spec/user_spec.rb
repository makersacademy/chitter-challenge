require 'spec_helper'

describe User do 
	let!(:user) do 
		User.create(name: 'Edu',
			mail: 'hedu.delgado@gmail.com',
			password: 'secret',
			password_confirmation: 'secret')
	end

	it 'will check validad mail and password' do
		authenticated_user = User.authenticate(user.mail, user.password)
		expect(authenticated_user).to eq user
	end
	it 'does not authenticate when given an incorrect password' do 
		expect(User.authenticate(user.mail, 'wrong_stupid_password')).to be nil
	end
end