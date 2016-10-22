feature 'Creating a user' do
	scenario 'and providing correct details' do
		visit('/users')
		expect(page.status_code).to eq 200
		fill_in :name, with: "user"
		fill_in :email, with: "user@example.com"
		fill_in :username, with: "exampleuser"
		fill_in :password, with: "password"
		fill_in :password_confirmation, with:"password"
		click_button "Join Chitter"
		expect(page).to have_content "You are signed in as user"
	end
end 	