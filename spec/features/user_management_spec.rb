feature "User sign up" do 

	scenario "I can sign up as a new user" do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content ('Welcome, ben@test.com')
		expect(User.first.email).to eq('ben@test.com')
	end

	scenario "requires a matching confirmation password" do
		expect {sign_up(password_confirmation: "wrong") }.not_to change(User, :count)
	end

	def sign_up(email: 'ben@test.com', password: 'password', password_confirmation: 'password')
		visit "/users/new"
		expect(page.status_code).to eq(200)
		fill_in :email, with: email
		fill_in :password, with: password
		fill_in :password_confirmation, with: password_confirmation
		click_button "Sign Up"
	end

end