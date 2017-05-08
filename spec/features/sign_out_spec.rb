
feature 'Sign out' do
	scenario 'User can sign out' do
		add_user
		sign_in("sam", "1234")
		click_button 'Sign out'
		expect(page).to have_content 'You are now signed out'
	end
end