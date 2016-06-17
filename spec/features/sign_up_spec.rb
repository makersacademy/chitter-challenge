feature 'Sign Up' do
	scenario 'I can sign up as a new user' do
		expect{sign_up}.to change(User, :count).by(1)
	end
end