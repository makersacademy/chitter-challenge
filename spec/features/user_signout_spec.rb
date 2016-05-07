feature 'User Signout' do
	scenario '- user can signout and gets a goodbye message not a greeting' do
		sign_up
		sign_in
		click_button('Sign out')
		expect(page).not_to have_content('Hello username')
		expect(page).to have_content('Goodbye username')
	end
end