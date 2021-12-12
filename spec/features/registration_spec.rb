
feature "registration" do
	
	scenario "A user can sign up" do
		visit '/users/new'
		fill_in("email", with: 'batman@gotham.com')
		fill_in('password', with: 'qwerty')
		click_button("Submit")

		expect(page).to have_content "Welcome, batman@gotham.com"
	end

end