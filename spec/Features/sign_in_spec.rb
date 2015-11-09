feature 'User sign in' do

	let(:user) do
		User.create(email: "eleni_s_2015@hotmail.com",
					password: "Passw0rd"
					password_confirmation: "Passw0rd"
	end

	scenario 'With correct log in details' do
		sign_in(email: user.email, password: user.password)
		expect(page).to have_content "Welcome, #{user.name}"
	end

end