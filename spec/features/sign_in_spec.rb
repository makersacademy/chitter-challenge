feature 'User signs in' do

	scenario 'signs in with correct credentials' do
		user = create :user
		sign_in(email: user.email,   password: 'secret1234')
		expect(page).to have_content "Welcome, #{user.username}"
	end
		
	def sign_in(email:, password:)
		visit '/sessions/new'
		fill_in :email, with: email
		fill_in :password, with: password
		click_button 'Sign in'
	end
end