require 'user'

RSpec.describe User do
	let(:user) { User.new('Juan', 'Perez', 'jp1975', 'jperez@gmail.com', 'Yolo1975!') }
	it 'has multiple attributes' do
		expect(user.name).to eq('Juan')
		expect(user.surname).to eq('Perez')
		expect(user.user_name).to eq('jp1975')
		expect(user.email).to eq('jperez@gmail.com')
		expect(user.password).to eq('Yolo1975!')
	end

	it 'is not signed in initially' do
		expect(user.status).to be_falsy
	end

	it 'can sign in' do
		user.sign_in
		expect(user.status).to be_truthy
	end

	it 'can log in' do
		user.log_out
		expect(user.status).to be_falsy
	end
end