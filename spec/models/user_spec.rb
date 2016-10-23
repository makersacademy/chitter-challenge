require './app/models/user'

describe User do

	subject { described_class.new(name: :name,
																		 email: :'example@example.com',
																		 username: :username,
																		 password: :password,
											               password_confirmation: :password)}

	describe '#name' do
		it 'returns the users name' do
			expect(subject.name).to eq 'name'
		end
	end

	describe '#email' do
		it 'returns the users email' do
			expect(subject.email).to eq 'example@example.com'
		end
	end

	describe '#username' do
		it 'returns the users username' do
			expect(subject.username).to eq 'username'
		end
	end

	describe '#password' do
		it 'returns the users password' do
			expect(subject.password).to eq :'password'
		end
	end
end