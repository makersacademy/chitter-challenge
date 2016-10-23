feature 'logging out' do
	
	let(:user) do 
		User.create(email: "foobar@example.com", password: "foobar",
			          password_confirmation: "foobar")
	end

	scenario "User can log out" do
	 visit '/'
   fill_in :email, with: user.email
   fill_in :password, with: user.password
   click_button "Sign In"
   click_button "Log Out"
   expect(page).to have_content "You have successfully logged out"
	end
end