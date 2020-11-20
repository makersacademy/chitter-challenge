require 'user'
require 'setup_test_database'

describe '#create' do 

	 it 'creates a user when they have signed up' do
 			user = User.create(email: 'test@google.com', password: 'password1')
 			expect(user).to be_a User
 			expect(user.email).to eq 'test@google.com'
 	end 
end
