feature 'user signup' do
	scenario 'I can sign up as a new user' do
		expect{sign_up}.to change(User, :count).by 1
		expect(page).to have_content('Welcome, alice@example.com')
		expect(User.first.email).to eq('alice@example.com')
	end

	scenario 'requires matching confirmation password' do
		expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
		expect(current_path).to eq('/users')
		expect(page).to have_content 'Password does not match the confirmation'
	end
end
