feature 'Sign Out' do
	scenario 'signed in user can sign out' do
		sign_up
		sign_in
		click_button 'Sign Out'
		expect(page).not_to have_content "Signed in as Faisal"
	end
end