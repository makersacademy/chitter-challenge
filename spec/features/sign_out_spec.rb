feature 'Sign out' do
	scenario 'user is no longer logged in after signing out' do
		sign_in		
		click_button('Sign out')
		expect(page).to_not have_content('Hi SuperSteve4Prez!')
		expect(page).to have_content 'Do creep again!'
	end
end
