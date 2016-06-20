
feature 'Sign In' do

	scenario 'user can sign in with correct credentials' do
		sign_up
		sign_in
		expect(page).to have_content "Signed in as Bob"
	end
	
end