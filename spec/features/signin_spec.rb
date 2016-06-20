feature 'Sign In' do

	scenario 'user can sign in with correct info' do
		sign_up
		sign_in
		expect(page).to have_content "Signed in as Faisal"
	end
	
end