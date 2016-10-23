feature 'logging out' do
	
	create_user

	scenario "User can log out" do
	 sign_in
   click_button "Log Out"
   expect(page).to have_content "You have successfully logged out"
	end
end